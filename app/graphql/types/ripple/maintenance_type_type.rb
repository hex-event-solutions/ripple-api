# frozen_string_literal: true

module Types
  module Ripple
    class MaintenanceTypeType < Types::BaseObject
      field :name, String, null: false

      field :maintenance_schedules, [Types::Ripple::MaintenanceScheduleType], null: true
      field :maintenance_events, [Types::Ripple::MaintenanceEventType], null: true
    end
  end
end
