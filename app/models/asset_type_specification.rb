# frozen_string_literal: true

class AssetTypeSpecification < ApplicationRecord
  template_values value: 'Template value'

  belongs_to :company
  belongs_to :asset_type
  belongs_to :specification

  validates :company, :asset_type, :specification, :value, presence: true
end
