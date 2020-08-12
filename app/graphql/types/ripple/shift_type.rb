# frozen_string_literal: true

module Types
  module Ripple
    class ShiftType < Types::BaseObject
      field :start, GraphQL::Types::ISO8601DateTime, null: false
      field :finish, GraphQL::Types::ISO8601DateTime, null: false
      field :rate, Float, null: false
      field :price, Float, null: false

      field :documents, [Types::Ripple::DocumentType], null: true

      field :crew, Types::Ripple::CrewType, null: false
      field :event, Types::Ripple::EventType, null: false
    end
  end
end
