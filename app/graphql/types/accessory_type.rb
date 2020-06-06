# frozen_string_literal: true

module Types
  class AccessoryType < Types::BaseObject
    field :id, ID, null: false
    field :quantity, Float, null: false

    field :asset_type, Type::AssetTypeType, null: false
    field :accessory, Type::AssetTypeType, null: false
  end
end
