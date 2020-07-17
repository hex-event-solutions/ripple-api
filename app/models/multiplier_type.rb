# frozen_string_literal: true

class MultiplierType < ApplicationRecord
  has_many :asset_type_multiplier_types
  has_many :asset_types, through: :asset_type_multiplier_types

  belongs_to :company

  validates :company, :name, :multiplier, :multiplier_type, :operand_type, :operand_quantity, presence: true
  validates :name, length: { maximum: 16 }
  validates :multiplier, :operand_quantity, numericality: true
  validates :operand_type, :multiplier_type, inclusion: %w[hour day week month year]
  validate :unique_unit_duration

  def unique_unit_duration
    existing_durations = MultiplierType.where(company_id: company_id).map(&:unit_duration)
    error_msg = 'cannot overlap with an existing duration multiplier'
    errors.add(:base, error_msg) if existing_durations.include? unit_duration
  end

  def self.operand_types
    %w[minute hour day week month year]
  end

  def self.lowest_operand_type(company_id)
    types = where(company_id: company_id).group_by(&:operand_type)
    operand_types.each do |type|
      return type if types[type]&.count&.positive?
    end
  end

  def price(rate:, current_price:, duration:)
    multiplier_increments = duration / unit_duration
    if multiplier_increments >= 1
      current_price += calculate_price(rate, multiplier_increments)
      duration -= (multiplier_increments.floor * unit_duration)
    end

    {
      rate: rate,
      current_price: current_price,
      duration: duration
    }
  end

  def calculate_price(rate, increments)
    multiplier_divisor = multiplier.to_f.public_send(multiplier_type.to_sym)
    rate * increments * (multiplier_divisor / 1.day).ceil
  end

  def unit_duration
    return unless %w[hour day week month year].include? operand_type

    operand_method = operand_type.to_sym
    operand_quantity&.public_send(operand_method)
  end
end
