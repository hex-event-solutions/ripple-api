# frozen_string_literal: true

module Types
  class DocumentItemType < Types::BaseObject
    field :id, ID, null: false
    field :quantity, Float, null: false
    field :discount, Int, null: false

    field :document, Types::DocumentType, null: false
    field :item, Types::ItemType, null: false
    field :item_type, Types::ItemTypeType, null: false
  end
end
