# frozen_string_literal: true

module Types
  module Ripple
    class MaintenanceEventType < Types::BaseObject
      field :details, String, null: true

      field :maintenance_schedule, Types::Ripple::MaintenanceScheduleType, null: true
      field :maintenance_type, Types::Ripple::MaintenanceTypeType, null: false
      field :maintenance_resolution, Types::Ripple::MaintenanceResolutionType, null: false
      field :asset, Types::Ripple::AssetType, null: false

      field :tasks, [Types::Ripple::MaintenanceTaskType], null: false
    end
  end
end
