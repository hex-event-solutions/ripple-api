# frozen_string_literal: true

module Types
  module Ripple
    class EventItemType < Types::BaseObject
      field :event, Types::Ripple::EventType, null: false
      field :item, Types::Ripple::ItemType, null: false
      field :quantity, Integer, null: false
      field :discount, Integer, null: false
    end
  end
end
