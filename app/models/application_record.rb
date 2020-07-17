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
end
