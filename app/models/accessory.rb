# frozen_string_literal: true

class Accessory < ApplicationRecord
  template_values quantity: 1

  belongs_to :company
  belongs_to :asset_type
  belongs_to :accessory, class_name: 'AssetType'

  validates :company, :asset_type, :accessory, :quantity, presence: true
  validates :quantity, numericality: true
end
