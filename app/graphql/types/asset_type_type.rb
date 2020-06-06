# frozen_string_literal: true

module Types
  class AssetTypeType < Types::BaseObject
    field :id, ID, null: false
    field :cost, Float, null: false
    field :rate, Float, null: false
    field :display_on_website, Boolean, null: false
    field :manufacturer, String, null: false
    field :model, String, null: false
    field :weight, Float, null: false
    field :description, String, null: false

    field :assets, [Types::AssetType], null: true
    field :asset_type_events, [Types::AssetTypeEventType], null: true
    field :events, [Types::EventType], null: true
    field :maintenance_schedules, [Types::MaintenanceScheduleType], null: true
    field :asset_type_specifications, [Types::AssetTypeSpecificationType], null: true
    field :asset_type_categories, [Types::AssetTypeCategoryType], null: true
    field :categories, [Types::CategoryType], null: true
    field :accessories, [Types::AccessoryType], null: true

    field :multiplier_type, Types::MultiplierTypeType, null: false
  end
end
