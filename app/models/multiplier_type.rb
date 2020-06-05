# frozen_string_literal: true

class MultiplierType < ApplicationRecord
  has_many :asset_types

  belongs_to :company

  validates :company, :name, :multiplier, :operand_type, :operand_quantity, presence: true
  validates :name, length: { maximum: 16 }
  validates :multiplier, :operand_quantity, numericality: true
  validates :operand_type, length: { maximum: 8 }
end
