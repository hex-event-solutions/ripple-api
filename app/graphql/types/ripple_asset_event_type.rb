# frozen_string_literal: true

module Types
  class RippleAssetEventType < Types::BaseObject
    field :asset, Types::RippleAssetType, null: false
    field :event, Types::RippleEventType, null: false
  end
end
