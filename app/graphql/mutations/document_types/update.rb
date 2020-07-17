# frozen_string_literal: true

module Mutations
  module DocumentTypes
    class Update < AuthorizedMutation
      include Helpers::Update

      argument :id, ID, required: true
      argument :name, String, required: true

      field :document_type, Types::RippleDocumentTypeType, null: true

      def resolve(id:, **params)
        update(DocumentType, id, params)
      end
    end
  end
end
