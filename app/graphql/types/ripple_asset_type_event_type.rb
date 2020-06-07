# frozen_string_literal: true

module Types
  class RippleAssetTypeEventType < Types::BaseObject
    field :quantity, Float, null: false
    field :discount, Int, null: false

    field :asset_type, Types::RippleAssetTypeType, null: false
    field :event, Types::RippleEventType, null: false
  end
end
