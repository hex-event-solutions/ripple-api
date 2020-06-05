# frozen_string_literal: true

class AssetTypeSpecification < ApplicationRecord
  belongs_to :asset_type
  belongs_to :specification

  validates :asset_type, :specification, :value, presence: true
end
