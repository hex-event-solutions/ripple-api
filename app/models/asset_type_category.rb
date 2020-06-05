# frozen_string_literal: true

class AssetTypeCategory < ApplicationRecord
  belongs_to :asset_type
  belongs_to :category

  validates :asset_type, :category, presence: true
end
