# frozen_string_literal: true

module Types
  class RippleMaintenanceTypeType < Types::BaseObject
    field :name, String, null: false

    field :maintenance_schedules, [Types::RippleMaintenanceScheduleType], null: true
  end
end
