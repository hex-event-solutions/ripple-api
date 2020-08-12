# frozen_string_literal: true

module Types
  module Ripple
    class AssetType < Types::BaseObject
      field :barcode, String, null: false

      field :events, [Types::Ripple::EventType], null: true
      field :maintenance_events, [Types::Ripple::MaintenanceEventType], null: true
      field :documents, [Types::Ripple::DocumentType], null: true

      field :asset_type, Types::Ripple::AssetTypeType, null: false
      field :asset_case, Types::Ripple::AssetCaseType, null: true
    end
  end
end
