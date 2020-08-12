# frozen_string_literal: true

module Types
  module Ripple
    class AssetTypeType < Types::BaseObject
      field :cost, Float, null: false
      field :rate, Float, null: false
      field :display_on_website, Types::BaseObject::Boolean, null: false
      field :manufacturer, String, null: false
      field :model, String, null: false
      field :weight, Float, null: false
      field :description, String, null: true
      field :name, String, null: false
      field :primary_image, Types::Ripple::ImageType, null: true

      field :assets, [Types::Ripple::AssetType], null: true
      field :events, [Types::Ripple::EventType], null: true
      field :maintenance_schedules, [Types::Ripple::MaintenanceScheduleType], null: true
      field :asset_type_specifications, [Types::Ripple::AssetTypeSpecificationType], null: true
      field :asset_type_categories, [Types::Ripple::AssetTypeCategoryType], null: true
      field :categories, [Types::Ripple::CategoryType], null: true
      field :accessories, [Types::Ripple::AccessoryType], null: true
      field :resource_images, [Types::Ripple::ResourceImageType], null: true
      field :images, [Types::Ripple::ImageType], null: true
      field :asset_type_multiplier_types, [Types::Ripple::AssetTypeMultiplierTypeType], null: false
      field :multiplier_types, [Types::Ripple::MultiplierTypeType], null: false
      field :documents, [Types::Ripple::DocumentType], null: true
    end
  end
end
