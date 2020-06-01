# frozen_string_literal: true

class AssetTypeSpecification < ApplicationRecord
  belongs_to :asset_type
  belongs_to :specification
end
