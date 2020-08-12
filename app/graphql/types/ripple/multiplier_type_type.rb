# frozen_string_literal: true

module Types
  module Ripple
    class MultiplierTypeType < Types::BaseObject
      field :name, String, null: false
      field :multiplier, Float, null: false
      field :multiplier_type, String, null: false
      field :operand_type, String, null: false
      field :operand_quantity, Float, null: false
      field :summary, String, null: false

      field :asset_types, [Types::Ripple::AssetTypeType], null: true
    end
  end
end
