# frozen_string_literal: true

class AssetType < ApplicationRecord
  include DocumentItems
  include EventItems
  include Resource

  has_many :assets
  has_many :maintenance_schedules
  has_many :asset_type_specifications
  has_many :specifications, through: :asset_type_specifications
  has_many :asset_type_categories
  has_many :categories, through: :asset_type_categories
  has_many :accessories
  has_many :asset_type_multiplier_types
  has_many :multiplier_types, through: :asset_type_multiplier_types
  has_many :images, through: :resource_images

  belongs_to :company

  validates :company, :cost, :rate, :manufacturer, :model, :weight, :description, presence: true
  validates :cost, :rate, :weight, numericality: true
  validates :display_on_website, inclusion: { in: [true, false] }
  validates :manufacturer, :model, length: { maximum: 64 }

  default_scope { includes(:accessories, :multiplier_types) }

  def price(date_start:, date_end:)
    duration = rounded_duration(date_start, date_end)
    properties = { rate: rate, current_price: 0, duration: duration }
    multipliers = multiplier_types.sort_by(&:unit_duration).reverse
    multipliers.each do |multiplier|
      properties = multiplier.price(**properties)
    end
    properties[:current_price]
  end

  def smallest_multiplier_increment
    types = multiplier_types.group_by(&:operand_type)
    MultiplierType.operand_types.each do |type|
      return type if types[type]&.count&.positive?
    end
  end

  def rounded_duration(date_start, date_end)
    denominator = smallest_multiplier_increment.to_sym
    divisor = 1.public_send(denominator)
    ((date_end - date_start).round.to_f / divisor).ceil.public_send(denominator)
  end
end
