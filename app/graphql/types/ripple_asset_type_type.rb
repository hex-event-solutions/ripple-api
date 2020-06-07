# frozen_string_literal: true

module Types
  class RippleAssetTypeType < Types::BaseObject
    field :cost, Float, null: false
    field :rate, Float, null: false
    field :display_on_website, Boolean, null: false
    field :manufacturer, String, null: false
    field :model, String, null: false
    field :weight, Float, null: false
    field :description, String, null: false

    field :assets, [Types::RippleAssetType], null: true
    field :asset_type_events, [Types::RippleAssetTypeEventType], null: true
    field :events, [Types::RippleEventType], null: true
    field :maintenance_schedules, [Types::RippleMaintenanceScheduleType], null: true
    field :asset_type_specifications, [Types::RippleAssetTypeSpecificationType], null: true
    field :asset_type_categories, [Types::RippleAssetTypeCategoryType], null: true
    field :categories, [Types::RippleCategoryType], null: true
    field :accessories, [Types::RippleAccessoryType], null: true

    field :multiplier_type, Types::RippleMultiplierTypeType, null: false
  end
end
