# frozen_string_literal: true

module Types
  module Ripple
    class EventType < Types::BaseObject
      field :date_start, GraphQL::Types::ISO8601DateTime, null: false
      field :date_end, GraphQL::Types::ISO8601DateTime, null: false
      field :date_out, GraphQL::Types::ISO8601DateTime, null: false
      field :date_return, GraphQL::Types::ISO8601DateTime, null: false
      field :description, String, null: false
      field :details, String, null: true
      field :location, String, null: false
      field :total_value, Float, null: false

      field :documents, [Types::Ripple::DocumentType], null: true
      field :assets, [Types::Ripple::AssetType], null: true
      field :asset_types, [Types::Ripple::AssetTypeType], null: true
      field :row_items, [Types::Ripple::RowItemType], null: true
      field :event_items, [Types::Ripple::EventItemType], null: true
      field :shifts, [Types::Ripple::ShiftType], null: true

      field :client, Types::Ripple::ClientType, null: false
    end
  end
end
