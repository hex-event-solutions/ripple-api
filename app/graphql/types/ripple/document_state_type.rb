# frozen_string_literal: true

module Types
  module Ripple
    class DocumentStateType < Types::BaseObject
      field :name, String, null: false

      field :document_state_events, [Types::Ripple::DocumentStateEventType], null: true
    end
  end
end
