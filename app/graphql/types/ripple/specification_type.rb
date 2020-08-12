# frozen_string_literal: true

module Types
  module Ripple
    class SpecificationType < Types::BaseObject
      field :name, String, null: false

      field :asset_type_specifications, [Types::Ripple::AssetTypeSpecificationType], null: true
      field :asset_types, [Types::Ripple::AssetTypeType], null: true
    end
  end
end
