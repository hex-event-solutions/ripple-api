# frozen_string_literal: true

module Mutations
  module DocumentTypes
    class Create < AuthorizedMutation
      include Helpers::Create

      argument :name, String, required: true
      argument :subject, Types::Ripple::DocumentTypeSubject, required: true
      argument :content, String, required: true
      argument :incremental, Boolean, required: false
      argument :date_issued, Boolean, required: false
      argument :date_due, Boolean, required: false
      argument :increment_pattern, String, required: false
      argument :increment_start, Integer, required: false

      field :document_type, Types::Ripple::DocumentTypeType, null: true

      def resolve(**params)
        create(DocumentType, context[:company_id], params)
      end
    end
  end
end
