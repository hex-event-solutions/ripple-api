# frozen_string_literal: true

module Types
  module Ripple
    class AccessoryType < Types::BaseObject
      field :quantity, Float, null: false

      field :asset_type, Types::Ripple::AssetTypeType, null: false
      field :accessory, Types::Ripple::AssetTypeType, null: false
    end
  end
end
