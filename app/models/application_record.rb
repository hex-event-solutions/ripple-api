# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def currency(value)
    "£#{format('%<value>.2f', value: value)}"
  end

  def percentage(value)
    value != 0 ? "#{format('%<value>.1f', value: value)}%" : ''
  end

  def address
    components = [
      address1,
      address2,
      address3,
      city,
      county,
      postcode
    ]
    components.compact.join("\n")
  end

  def self.template_values(values = nil)
    @template_values = values unless values.nil?

    @template_values || {}
  end

  def self.template(company_id:)
    find_by(company_id: company_id, template: true)
  end

  def self.create_template!(company:, **overrides)
    attributes = (@template_values || {}).merge(overrides)
    create!(company: company, template: true, **attributes)
  end

  def self.without_templates
    where.not(template: true)
  end

  def self.mustache(**fields)
    fields.each_key do |field|
      mustache_field = "mustache_#{field}".to_sym
      define_method mustache_field do
        fields[field].call(public_send(field))
      end
    end
  end
end
