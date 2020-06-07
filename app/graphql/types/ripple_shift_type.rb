# frozen_string_literal: true

module Types
  class RippleShiftType < Types::BaseObject
    field :start, GraphQL::Types::ISO8601DateTime, null: false
    field :finish, GraphQL::Types::ISO8601DateTime, null: false
    field :rate, Float, null: false
    field :price, Float, null: false

    field :crew, Types::RippleCrewType, null: false
    field :event, Types::RippleEventType, null: false
  end
end
