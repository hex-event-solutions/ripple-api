# frozen_string_literal: true

module Types
  class RippleMaintenanceEventType < Types::BaseObject
    field :details, String, null: true

    field :maintenance_schedule, Types::RippleMaintenanceScheduleType, null: false
    field :maintenance_resolution, Types::RippleMaintenanceResolutionType, null: false
    field :asset, Types::RippleAssetType, null: false
  end
end
