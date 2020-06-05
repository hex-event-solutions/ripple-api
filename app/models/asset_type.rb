# frozen_string_literal: true

class AssetType < ApplicationRecord
  has_many :assets
  has_many :asset_type_events
  has_many :events, through: :asset_type_events
  has_many :maintenance_schedules
  has_many :asset_type_specifications
  has_many :specifications, through: :asset_type_specifications
  has_many :asset_type_categories
  has_many :categories, through: :asset_type_categories
  has_many :accessories

  belongs_to :company
  belongs_to :multiplier_type

  validates :company, :cost, :rate, :multiplier_type, :manufacturer, :model, :weight, :description, presence: true
  validates :cost, :rate, :weight, numericality: true
  validates :display_on_website, inclusion: { in: [true, false] }
  validates :manufacturer, :model, length: { maximum: 64 }
end
