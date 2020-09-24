# frozen_string_literal: true

module Types
  module Ripple
    class AssetTypeMaintenanceScheduleType < Types::BaseObject
      field :asset_type, Types::Ripple::AssetTypeType, null: false
      field :maintenance_schedule, Types::Ripple::MaintenanceScheduleType, null: false
    end
  end
end
