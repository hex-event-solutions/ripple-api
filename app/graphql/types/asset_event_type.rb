# frozen_string_literal: true

module Types
  class AssetEventType < Types::BaseObject
    field :id, ID, null: false

    field :asset, Types::AssetType, null: false
    field :event, Types::EventType, null: false
  end
end
