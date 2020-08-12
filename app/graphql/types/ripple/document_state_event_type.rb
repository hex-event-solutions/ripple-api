# frozen_string_literal: true

module Types
  module Ripple
    class DocumentStateEventType < Types::BaseObject
      field :details, String, null: true

      field :document, Types::Ripple::DocumentType, null: false
      field :document_state, Types::Ripple::DocumentStateType, null: false
    end
  end
end
