# frozen_string_literal: true

module Types
  class RippleAssetType < Types::BaseObject
    field :barcode, String, null: false

    field :asset_events, [Types::RippleAssetEventType], null: true
    field :events, [Types::RippleEventType], null: true
    field :maintenance_events, [Types::RippleMaintenanceEventType], null: true

    field :asset_type, Types::RippleAssetTypeType, null: false
    field :asset_case, Types::RippleAssetCaseType, null: true
  end
end
