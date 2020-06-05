# frozen_string_literal: true

class AssetTypeEvent < ApplicationRecord
  belongs_to :asset_type
  belongs_to :event

  validates :asset_type, :event, :quantity, :discount, presence: true
  validates :quantity, :discount, numericality: true
end
