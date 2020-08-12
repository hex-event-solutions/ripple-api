# frozen_string_literal: true

class AssetTypeCategory < ApplicationRecord
  belongs_to :company
  belongs_to :asset_type
  belongs_to :category

  validates :company, :asset_type, :category, presence: true

  default_scope { includes(:category) }
end
