# frozen_string_literal: true

module Mutations
  module Companies
    class Create < AuthorizedMutation
      argument :name, String, required: true
      argument :vat_number, String, required: false
      argument :company_number, String, required: false
      argument :address1, String, required: false
      argument :address2, String, required: false
      argument :address3, String, required: false
      argument :city, String, required: false
      argument :county, String, required: false
      argument :postcode, String, required: false
      argument :phone_number, String, required: false
      argument :logo, String, required: false
      argument :domain, String, required: false

      field :company, Types::Ripple::CompanyType, null: true

      def resolve(name:, **params)
        company = Company.new(name: name, **params)

        return { company: company } if company.save

        raise GraphQL::ExecutionError, company.errors.full_messages.join(', ')
      end
    end
  end
end
