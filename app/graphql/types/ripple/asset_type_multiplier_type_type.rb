# frozen_string_literal: true

module Types
  module Ripple
    class AssetTypeMultiplierTypeType < Types::BaseObject
      field :asset_type, Types::Ripple::AssetTypeType, null: false
      field :multiplier_type, Types::Ripple::MultiplierTypeType, null: false
    end
  end
end
