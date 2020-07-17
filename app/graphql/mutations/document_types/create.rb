# frozen_string_literal: true

module Mutations
  module DocumentTypes
    class Create < AuthorizedMutation
      include Helpers::Create

      argument :name, String, required: true

      field :document_type, Types::RippleDocumentTypeType, null: true

      def resolve(**params)
        create(DocumentType, context[:company_id], params)
      end
    end
  end
end
