# frozen_string_literal: true

module Mutations
  module DocumentTypes
    class Update < AuthorizedMutation
      include Helpers::Update

      argument :id, ID, required: true
      argument :name, String, required: true
      argument :subject, String, required: true
      argument :header, String, required: false
      argument :footer, String, required: false
      argument :content, String, required: true
      argument :styles, String, required: false
      argument :incremental, Boolean, required: false
      argument :date_issued, Boolean, required: false
      argument :date_due, Boolean, required: false
      argument :increment_pattern, String, required: false
      argument :increment_start, Integer, required: false

      field :document_type, Types::Ripple::DocumentTypeType, null: false

      def resolve(id:, **params)
        update(DocumentType, id, params)
      end
    end
  end
end
