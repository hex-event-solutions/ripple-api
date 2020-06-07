# frozen_string_literal: true

module Types
  class RippleDocumentStateType < Types::BaseObject
    field :name, String, null: false

    field :document_state_events, [Types::RippleDocumentStateEventType], null: true
  end
end
