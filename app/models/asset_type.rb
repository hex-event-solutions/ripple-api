# frozen_string_literal: true

class AssetType < ApplicationRecord
  has_many :assets
  has_many :asset_type_events
  has_many :events, through: :asset_type_events
  has_many :maintenance_schedules
  has_many :specifications
  has_many :values, through: :specifications
  has_many :asset_type_categories
  has_many :categories, through: :asset_type_categories

  enum rate_multiplier: %i[daily short_week weekly monthly annually]
end
