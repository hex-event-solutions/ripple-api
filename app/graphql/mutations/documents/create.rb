# frozen_string_literal: true

module Mutations
  module Documents
    class Create < AuthorizedMutation
      include Helpers::Create

      argument :document_type_id, String, required: true
      argument :subject_id, String, required: true
      argument :reference, String, required: false
      argument :date_issued, String, required: false
      argument :date_due, String, required: false

      field :document, Types::Ripple::DocumentType, null: true

      def resolve(**params)
        doc_type = DocumentType.find_by(company_id: context[:company_id], id: params[:document_type_id])

        params = number_document(doc_type, params)

        document = Document.new(company_id: context[:company_id], **params)

        return generate(document) if document.save

        raise GraphQL::ExecutionError, document.errors.full_messages.join(', ')
      end

      def number_document(doc_type, params)
        if doc_type.incremental
          next_number = doc_type.next_number
          params[:reference] = doc_type.reference_for(next_number)
          params[:number] = next_number
        end
        params
      end

      def generate(document)
        document.generate
        { document: document }
      end
    end
  end
end
