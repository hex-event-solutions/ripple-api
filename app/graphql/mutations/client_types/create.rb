# frozen_string_literal: true

module Mutations
  module ClientTypes
    class Create < AuthorizedMutation
      include Helpers::Create

      argument :name, String, required: true

      field :client_type, Types::Ripple::ClientTypeType, null: true

      def resolve(**params)
        create(ClientType, context[:company_id], params)
      end
    end
  end
end
