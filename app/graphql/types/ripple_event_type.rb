# frozen_string_literal: true

module Types
  class RippleEventType < Types::BaseObject
    field :date_start, GraphQL::Types::ISO8601DateTime, null: false
    field :date_end, GraphQL::Types::ISO8601DateTime, null: false
    field :date_out, GraphQL::Types::ISO8601DateTime, null: false
    field :date_return, GraphQL::Types::ISO8601DateTime, null: false
    field :description, String, null: false
    field :details, String, null: true
    field :location, String, null: false

    field :documents, [Types::RippleDocumentType], null: true
    field :asset_events, [Types::RippleAssetEventType], null: true
    field :assets, [Types::RippleAssetType], null: true
    field :asset_type_events, [Types::RippleAssetTypeEventType], null: true
    field :asset_types, [Types::RippleAssetTypeType], null: true
    field :shifts, [Types::RippleShiftType], null: true

    field :client, Types::RippleClientType, null: false
  end
end
