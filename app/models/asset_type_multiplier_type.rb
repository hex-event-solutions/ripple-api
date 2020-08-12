# frozen_string_literal: true

class AssetTypeMultiplierType < ApplicationRecord
  belongs_to :company
  belongs_to :asset_type
  belongs_to :multiplier_type

  validates :company, :asset_type, :multiplier_type, presence: true

  default_scope { includes(:multiplier_type) }
end
