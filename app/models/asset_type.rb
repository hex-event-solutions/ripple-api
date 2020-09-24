# frozen_string_literal: true

class AssetType < ApplicationRecord
  include Documents
  include EventItems
  include Resource

  template_values(
    cost: 180,
    manufacturer: 'Template',
    model: 'Asset type',
    rate: 80,
    display_on_website: true,
    weight: 22,
    description: 'Template description'
  )

  has_many :assets, dependent: :destroy
  has_many :asset_type_maintenance_schedules, dependent: :destroy
  has_many :maintenance_schedules, through: :asset_type_maintenance_schedules
  has_many :asset_type_specifications, dependent: :destroy
  has_many :specifications, through: :asset_type_specifications
  has_many :asset_type_categories, dependent: :destroy
  has_many :categories, through: :asset_type_categories
  has_many :accessories, dependent: :destroy
  has_many :asset_type_multiplier_types, dependent: :destroy
  has_many :multiplier_types, through: :asset_type_multiplier_types

  belongs_to :company

  validates :company, :cost, :rate, :manufacturer, :model, :weight, presence: true
  validates :cost, :rate, :weight, numericality: { greater_than_or_equal_to: 0 }
  validates :display_on_website, inclusion: { in: [true, false] }
  validates :manufacturer, :model, length: { maximum: 64 }

  default_scope { includes(:company) }

  mustache(
    name: ->(v) { v },
    assets: ->(v) { v.to_a },
    categories: ->(v) { v.to_a },
    description: ->(v) { v },
    accessories: ->(v) { v.to_a }
  )

  def name
    "#{manufacturer != company.short_name ? "#{manufacturer} " : ''}#{model}"
  end

  def duration_price(date_start:, date_end:)
    duration = rounded_duration(date_start, date_end)
    properties = { rate: rate, current_price: 0, duration: duration }
    multipliers = multiplier_types.sort_by(&:unit_duration).reverse
    multipliers.each do |multiplier|
      properties = multiplier.price(**properties)
    end
    properties[:current_price]
  end

  def smallest_multiplier_duration
    multiplier_types.min_by(&:unit_duration)
  end

  def rounded_duration(date_start, date_end)
    multiplier = smallest_multiplier_duration
    raise 'No multipliers set for this asset type' if multiplier.nil?

    divisor = multiplier.unit_duration
    base_multiplier = multiplier.operand_quantity
    denominator = multiplier.operand_type
    ret = (((date_end - date_start).round.to_f / divisor).ceil * base_multiplier).public_send(denominator)
    puts ret
    ret
  end

  def formatted_accessories(event_item)
    return unless accessories.any?

    accessories.map do |acc|
      ei_dup = event_item.dup
      ei_dup.quantity *= acc.quantity
      accessory = acc.accessory.formatted_hash(ei_dup)
      out = [accessory]
      out << accessory[:mustache_accessories] if accessory[:mustache_accessories]&.any?
      accessory.delete(:mustache_accessories)
      out
    end
  end

  def formatted_hash(event_item)
    item = attributes.symbolize_keys
    item[:mustache_name] = name
    item[:mustache_description] = description
    item[:mustache_accessories] = formatted_accessories(event_item)&.flatten
    item[:unit_price] = currency(rate)
    item[:quantity] = event_item.quantity
    item[:name] = name
    item
  end

  def cost_with_accessories
    cost + accessory_cost
  end

  def accessory_cost
    accessories.map(&:accessory).map(&:cost_with_accessories).reduce(&:+) || 0
  end

  def primary_image
    images.first
  end

  def available_accessories
    asset_type_ids = accessories.map(&:accessory_id) + [id]
    AssetType.where(company_id: company_id).where.not(id: asset_type_ids).without_templates
  end

  def available_categories
    category_ids = asset_type_categories.map(&:category_id)
    Category.where(company_id: company_id).where.not(id: category_ids).without_templates
  end

  def available_multiplier_types
    multiplier_type_ids = asset_type_multiplier_types.map(&:multiplier_type_id)
    MultiplierType.where(company_id: company_id).where.not(id: multiplier_type_ids).without_templates
  end

  def available_maintenance_schedules
    maintenance_schedule_ids = asset_type_maintenance_schedules.map(&:maintenance_schedule_id)
    MaintenanceSchedule.where(company_id: company_id).where.not(id: maintenance_schedule_ids).without_templates
  end

  def available_specifications
    specification_ids = asset_type_specifications.map(&:specification_id)
    Specification.where(company_id: company_id).where.not(id: specification_ids).without_templates
  end
end
