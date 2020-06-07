# frozen_string_literal: true

module Types
  class RippleMaintenanceScheduleType < Types::BaseObject
    field :details, String, null: true
    field :repeat_multiplier, Int, null: false
    field :repeat_period, String, null: false

    field :maintenance_events, [Types::RippleMaintenanceEventType], null: true

    field :asset_type, Types::RippleAssetTypeType, null: false
    field :maintenance_type, Types::RippleMaintenanceTypeType, null: false
  end
end
