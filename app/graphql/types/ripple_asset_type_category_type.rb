# frozen_string_literal: true

module Types
  class RippleAssetTypeCategoryType < Types::BaseObject
    field :asset_type, Types::RippleAssetTypeType, null: false
    field :category, Types::RippleCategoryType, null: false
  end
end
