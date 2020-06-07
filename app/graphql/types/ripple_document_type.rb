# frozen_string_literal: true

module Types
  class RippleDocumentType < Types::BaseObject
    field :document_items, [Types::RippleDocumentItemType], null: true
    field :asset_types, [Types::RippleAssetTypeType], null: true
    field :row_items, [Types::RippleRowItemType], null: true

    field :client, Types::RippleClientType, null: false
    field :event, Types::RippleEventType, null: true
    field :document_type, Types::RippleDocumentTypeType, null: false
  end
end
