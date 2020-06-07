# frozen_string_literal: true

module Types
  class RippleDocumentItemType < Types::BaseObject
    field :quantity, Float, null: false
    field :discount, Int, null: false

    field :document, Types::RippleDocumentType, null: false
    field :item, Types::RippleItemType, null: false
  end
end
