# frozen_string_literal: true

module Types
  class RippleAssetTypeSpecificationType < Types::BaseObject
    field :value, String, null: false

    field :asset_type, Types::RippleAssetTypeType, null: false
    field :specification, Types::RippleSpecificationType, null: false
  end
end
