# frozen_string_literal: true

module Types
  class AssetType < Types::BaseObject
    field :id, ID, null: false
    field :barcode, String, null: false

    field :asset_events, [Types::AssetEventType], null: true
    field :events, [Types::EventType], null: true
    field :maintenance_events, [Types::MaintenanceEventType], null: true

    field :asset_type, Types::AssetTypeType, null: false
    field :asset_case, Types::AssetCaseType, null: false
  end
end
