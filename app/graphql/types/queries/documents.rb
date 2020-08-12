# frozen_string_literal: true

module Types
  module Queries
    module Documents
      def self.included(base)
        base.field :documents, [Types::Ripple::DocumentType], null: false, description: 'Returns all documents'
      end

      def documents
        Document.where(company_id: context[:company_id]).without_templates
      end
    end
  end
end
