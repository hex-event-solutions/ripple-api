# frozen_string_literal: true

module Types
  module Queries
    module DocumentTypes
      def self.included(base)
        base.field :document_types,
                   [Types::Ripple::DocumentTypeType],
                   null: false,
                   description: 'Returns all document types' do
          argument :subject, Types::Ripple::DocumentTypeSubject, required: false
        end
        base.field :document_type,
                   Types::Ripple::DocumentTypeType,
                   null: false,
                   description: 'Returns a specific document type' do
          argument :id, Types::BaseObject::ID, required: true
        end
      end

      def document_types(subject: nil)
        doc_types = DocumentType.where(company_id: context[:company_id]).without_templates

        return doc_types unless subject

        doc_types.where(subject: subject)
      end

      def document_type(id:)
        DocumentType.find_by!(company_id: context[:company_id], id: id)
      end
    end
  end
end
