# frozen_string_literal: true

class Client < ApplicationRecord
  include Documents

  template_values(
    organisation_name: 'Template client',
    address1: 'A room',
    address2: 'A block',
    address3: 'A street',
    city: 'A city',
    county: 'A county',
    postcode: 'A postcode',
    discount: 0
  )

  has_many :contacts
  has_many :events

  belongs_to :company
  belongs_to :client_type

  validates :organisation_name, presence: true, length: { maximum: 128 }, uniqueness: { scope: :company_id }
  validates :address1, :address2, :address3, :city, :county, length: { maximum: 64 }
  validates :postcode, length: { maximum: 10 }
  validates :discount, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :company, :client_type, :city, :county, :postcode, presence: true

  mustache(
    organisation_name: ->(v) { v },
    address: ->(v) { v }
  )
end
