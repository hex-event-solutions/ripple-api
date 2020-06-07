# frozen_string_literal: true

module Types
  class RippleSpecificationType < Types::BaseObject
    field :name, String, null: false

    field :asset_type_specifications, [Types::RippleAssetTypeSpecificationType], null: true
    field :asset_types, [Types::RippleAssetTypeType], null: true
  end
end
