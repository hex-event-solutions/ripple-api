# frozen_string_literal: true

module Types
  class RippleMultiplierTypeType < Types::BaseObject
    field :name, String, null: false
    field :multiplier, Float, null: false
    field :operand_type, String, null: false
    field :operand_quantity, Float, null: false

    field :asset_types, [Types::RippleAssetTypeType], null: true
  end
end
