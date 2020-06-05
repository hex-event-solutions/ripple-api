# frozen_string_literal: true

class Accessory < ApplicationRecord
  belongs_to :asset_type
  belongs_to :accessory, class_name: 'AssetType', foreign_key: :accessory_asset_type_id

  validates :asset_type, :accessory, :quantity, presence: true
  validates :quantity, numericality: true
end
