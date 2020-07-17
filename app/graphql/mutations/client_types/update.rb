# frozen_string_literal: true

module Mutations
  module ClientTypes
    class Update < AuthorizedMutation
      include Helpers::Update

      argument :id, ID, required: true
      argument :name, String, required: true

      field :client_type, Types::RippleClientTypeType, null: true

      def resolve(id:, **params)
        update(ClientType, id, params)
      end
    end
  end
end
