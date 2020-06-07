# frozen_string_literal: true

module Types
  class RippleDocumentStateEventType < Types::BaseObject
    field :details, String, null: true

    field :document, Types::RippleDocumentType, null: false
    field :document_state, Types::RippleDocumentStateType, null: false
  end
end
