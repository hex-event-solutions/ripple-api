# frozen_string_literal: true

module Mutations
  module DocumentStates
    class Create < AuthorizedMutation
      include Helpers::Create

      argument :name, String, required: true

      field :document_state, Types::RippleDocumentStateType, null: true

      def resolve(**params)
        create(DocumentState, context[:company_id], params)
      end
    end
  end
end
