# frozen_string_literal: true

module Mutations
  module Clients
    class Create < AuthorizedMutation
      include Helpers::Create

      argument :client_type_id, Types::BaseObject::ID, required: true
      argument :organisation_name, String, required: true
      argument :address1, String, required: true
      argument :address2, String, required: false
      argument :address3, String, required: false
      argument :city, String, required: false
      argument :county, String, required: false
      argument :postcode, String, required: false
      argument :discount, Int, required: true

      field :client, Types::Ripple::ClientType, null: true

      def resolve(**params)
        create(Client, context[:company_id], params)
      end
    end
  end
end
