# frozen_string_literal: true

module Types
  module Ripple
    class AssetTypeSpecificationType < Types::BaseObject
      field :value, String, null: false

      field :asset_type, Types::Ripple::AssetTypeType, null: false
      field :specification, Types::Ripple::SpecificationType, null: false
    end
  end
end
