# frozen_string_literal: true

module Types
  module Ripple
    class CompanyType < Types::BaseObject
      field :name, String, null: false
      field :vat_number, String, null: true
      field :company_number, String, null: true
      field :address1, String, null: true
      field :address2, String, null: true
      field :address3, String, null: true
      field :city, String, null: true
      field :county, String, null: true
      field :postcode, String, null: true
      field :phone_number, String, null: true
      field :logo, String, null: true
      field :domain, String, null: true
      field :address, String, null: false

      # Only return if user is ripple admin
      def self.authorized?(_object, context)
        context[:ripple_admin]
      end
    end
  end
end
