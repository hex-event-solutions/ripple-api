# frozen_string_literal: true

module Types
  module Ripple
    class NextMaintenanceEventType < Types::BaseObject
      field :maintenance_schedule, Types::Ripple::MaintenanceScheduleType, null: false
      field :due, GraphQL::Types::ISO8601DateTime, null: false
    end
  end
end
