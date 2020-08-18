# frozen_string_literal: true

require 'yaml'

class YamlToHtml
  class << self
    def convert(yaml)
      input = YAML.safe_load(yaml)

      html = ''

      input['content'].each do |row|
        html += process_row(row)
      end

      html
    end

    def padding_classes(padding_input)
      padding = []
      padding_input.each_key do |direction|
        next unless %w[top bottom left right].include? direction

        value = padding_input[direction]
        padding << "p#{direction[0]}-#{value}"
      end
      padding.join ' '
    end

    def to_mustache(text)
      text.gsub(/<([a-z_]*)>/, '{{\1}}')
    end

    def format_text(text)
      template_text = to_mustache(text)
      template_text.gsub(/\^\^([^\^]+)\^\^/, '<b>\1</b>')
                   .gsub(%r{//([^/]+)//}, '<i>\1</i>')
    end

    def process_text(text, negative: false)
      if text['text']
        formatted_text = format_text(text['text'])
        tag = text['heading'] ? "h#{text['heading']}" : 'p'
        build_tag(text, formatted_text, tag_name: tag, negative: negative)
      elsif text['present'] && text['missing']
        process_text_boolean(text)
      end
    end

    def process_text_boolean(text)
      out = ''
      text['present'].each do |text_obj|
        text_obj['context'] = text['context']
        out += process_text(text_obj)
      end
      text['missing'].each do |text_obj|
        text_obj['context'] = text['context']
        out += process_text(text_obj, negative: true)
      end
      out
    end

    def with(context, tag, negative: false)
      return tag unless context

      prefix = context != 'document' ? 'mustache_' : ''

      open_context = "{{#{negative ? '^' : '#'}#{prefix}#{context}}}"
      close_context = "{{/#{prefix}#{context}}}"

      "#{open_context}#{tag}#{close_context}"
    end

    def build_table_headings(headings)
      out = '<thead><tr>'
      headings.each do |heading|
        out += "<td>#{heading}</td>"
      end
      out += '</tr></thead>'
      out
    end

    def build_table_row(row)
      table_row = '<tr>'
      row['cells'].each do |cell|
        if cell['blank']
          (0..cell['blank'] - 1).each { table_row += '<td></td>' }
        else
          table_row += "<td colspan=#{cell['width'] || 1} class='#{cell['style'] || ''}'>#{process_text(cell)}</td>"
        end
      end
      table_row += '</tr>'
      table_row
    end

    def build_table_content(content)
      out = ''
      if content['content']
        rows = ''
        content['content'].each { |row| rows += build_table_content(row) }
        out += with(content['context'], rows)
      else
        out += build_table_row(content)
      end
      out
    end

    def build_table(table)
      out = ''
      out += "<div class='col'><table class='table text-left bordered'>"
      out += build_table_headings(table['headings'])
      out += '<tbody>'
      table['content'].each do |row|
        out += build_table_content(row)
      end
      out += '</tbody></table></div>'
      out
    end

    def process_col(col)
      out = ''
      if col == 'blank'
        out += '<div></div>'
      elsif col['content'].is_a? Array
        col['content'].each { |block| out += process_text(block) }
      else
        out += process_text(col)
      end

      build_tag(col, out, class_name: 'col')
    end

    def process_row(row)
      out = ''
      out += build_tag(row, build_table(row['table']), class_name: 'row') if row['table']
      cols = ''
      row['content']&.each do |col|
        cols += process_col(col)
      end
      out += build_tag(row, cols, class_name: 'row')
      out
    end

    def build_tag(obj, content, class_name: '', tag_name: 'div', negative: false)
      out = ''
      padding = obj['padding'] ? padding_classes(obj['padding']) : ''
      style = obj['style'] || ''

      classes = [class_name, padding, style].reject(&:empty?).join ' '
      class_string = !classes.empty? ? " class='#{classes}'" : ''

      out += with(obj['context'], "<#{tag_name}#{class_string}>#{content}</#{tag_name}>", negative: negative)
      out
    end
  end
end
