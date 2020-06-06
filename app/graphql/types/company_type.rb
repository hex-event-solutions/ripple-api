# frozen_string_literal: true

module Types
  class CompanyType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :vat_number, String, null: true
    field :company_number, String, null: true
    field :address1, String, null: false
    field :address2, String, null: true
    field :address3, String, null: true
    field :city, String, null: false
    field :county, String, null: false
    field :postcode, String, null: false
    field :phone_number, String, null: false
    field :logo, String, null: true
  end
end
