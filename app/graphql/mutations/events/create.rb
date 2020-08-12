# frozen_string_literal: true

module Mutations
  module Events
    class Create < AuthorizedMutation
      include Helpers::Create

      argument :client_id, Types::BaseObject::ID, required: true
      argument :date_start, GraphQL::Types::ISO8601DateTime, required: true
      argument :date_end, GraphQL::Types::ISO8601DateTime, required: true
      argument :date_out, GraphQL::Types::ISO8601DateTime, required: false
      argument :date_return, GraphQL::Types::ISO8601DateTime, required: false
      argument :description, String, required: false
      argument :details, String, required: false
      argument :location, String, required: false

      field :event, Types::Ripple::EventType, null: true

      def resolve(**params)
        create(Event, context[:company_id], params)
      end
    end
  end
end
