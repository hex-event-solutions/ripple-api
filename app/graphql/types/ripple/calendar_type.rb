# frozen_string_literal: true

module Types
  module Ripple
    class CalendarType < Types::BaseObject
      field :date, GraphQL::Types::ISO8601DateTime, null: false
      field :days, [Types::Ripple::CalendarDayType], null: false
    end
  end
end
