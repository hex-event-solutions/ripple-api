# frozen_string_literal: true

module Mutations
  module DocumentStates
    class Update < AuthorizedMutation
      include Helpers::Update

      argument :id, ID, required: true
      argument :name, String, required: true

      field :document_state, Types::Ripple::DocumentStateType, null: true

      def resolve(id:, **params)
        update(DocumentState, id, params)
      end
    end
  end
end
