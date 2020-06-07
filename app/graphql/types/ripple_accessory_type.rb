# frozen_string_literal: true

module Types
  class RippleAccessoryType < Types::BaseObject
    field :quantity, Float, null: false

    field :asset_type, Types::RippleAssetTypeType, null: false
    field :accessory, Types::RippleAssetTypeType, null: false
  end
end
