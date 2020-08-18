# frozen_string_literal: true

module Types
  module Ripple
    class CalendarDayType < Types::BaseObject
      field :date, GraphQL::Types::ISO8601DateTime, null: false
      field :events, [Types::Ripple::EventType], null: true
    end
  end
end
