# frozen_string_literal: true

module Types
  class RippleRowItemType < Types::BaseObject
    field :price, Float, null: false
    field :description, String, null: false

    field :document_items, [Types::RippleDocumentItemType], null: true
    field :items, [Types::RippleItemType], null: true
  end
end
