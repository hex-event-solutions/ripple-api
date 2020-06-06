# frozen_string_literal: true

module Types
  class AssetTypeEventType < Types::BaseObject
    field :id, ID, null: false
    field :quantity, Float, null: false
    field :discount, Int, null: false

    field :asset_type, Types::AssetTypeType, null: false
    field :event, Types::EventType, null: false
  end
end
