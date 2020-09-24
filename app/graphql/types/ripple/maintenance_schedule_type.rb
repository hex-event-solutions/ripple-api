# frozen_string_literal: true

module Types
  module Ripple
    class MaintenanceScheduleType < Types::BaseObject
      field :details, String, null: true
      field :repeat_multiplier, Int, null: false
      field :repeat_period, String, null: false
      field :summary, String, null: false

      field :maintenance_events, [Types::Ripple::MaintenanceEventType], null: true
      field :documents, [Types::Ripple::DocumentType], null: true

      field :asset_type, Types::Ripple::AssetTypeType, null: false
      field :maintenance_type, Types::Ripple::MaintenanceTypeType, null: false
    end
  end
end
