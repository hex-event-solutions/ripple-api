# frozen_string_literal: true

require 'yaml_to_html'

class DocumentType < ApplicationRecord
  has_many :documents, -> { where template: false }

  belongs_to :company

  validates :company, :name, :content, :subject, presence: true
  validates :name, length: { maximum: 32 }, uniqueness: { scope: %i[company_id subject] }

  before_destroy :destroy_templates

  def full_styles
    %(
      #{Setting.for(company_id: company.id, name: 'Document styles')}
      #{styles}
    )
  end

  def full_template
    %(
      <!DOCTYPE html>
      <html>
        <head>
          <meta charset="utf-8">
          <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
          <style>#{full_styles}</style>
        </head>
        <body>
          <div class='container-fluid p-5'>
            {{#subject}}#{YamlToHtml.convert(content)}{{/subject}}
          </div>
        </body>
      </html>
    )
  end

  def header_template
    %(
      <!DOCTYPE html>
      <html>
        <head>
          <meta charset="utf-8">
          <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
          <style>#{full_styles}</style>
        </head>
        <body>
          {{#subject}}
            #{Setting.for(company_id: company.id, name: 'Document header')}
            #{header}
          {{/subject}}
        </body>
      </html>
    )
  end

  def footer_template
    %(
      <!DOCTYPE html>
      <html>
        <head>
          <meta charset="utf-8">
          <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
          <style>#{full_styles}</style>
          <script>
            function number_pages() {
              var vars={};
              var x=document.location.search.substring(1).split('&');
              for(var i in x) {var z=x[i].split('=',2);vars[z[0]] = decodeURIComponent(z[1]);}
              var x=['frompage','topage','page','webpage','section','subsection','subsubsection'];
              for(var i in x) {
                var y = document.getElementsByClassName(x[i]);
                for(var j=0; j<y.length; ++j) y[j].textContent = vars[x[i]];
              }
            }
          </script>
        </head>
        <body onload="number_pages()">
          {{#subject}}
            #{footer}
            #{Setting.for(company_id: company.id, name: 'Document footer')}
          {{/subject}}
        </body>
      </html>
    )
  end

  def generate_first
    subject_class = subject.constantize
    obj = subject_class.template(company_id: company.id)
    doc = Document.create!(
      company: company,
      subject_id: obj.id,
      document_type: self,
      date_issued: Time.now,
      date_due: Time.now + 14.days,
      number: 42,
      reference: reference_for(42),
      template: true
    )
    doc.generate
  end

  def destroy_templates
    Document.where(document_type_id: id).each(&:destroy)
  end

  def next_number
    return '' unless incremental

    base = documents.map(&:number).max || 0

    [base + 1, increment_start].max
  end

  def reference_for(number)
    pre, placeholder, post = increment_pattern.match(/^(.*)\((0*)\)(.*)$/).captures
    formatter = "%0#{placeholder&.length || 0}d"
    format("#{pre}#{formatter}#{post}", number)
  end
end
