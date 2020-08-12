# frozen_string_literal: true

module Mutations
  module DocumentTypes
    class Generate < AuthorizedMutation
      resource :document

      argument :id, String, required: true

      field :document, Types::Ripple::DocumentAttachmentType, null: true

      def resolve(**params)
        doc = DocumentType.find_by(company_id: context[:company_id], id: params[:id]).generate_first

        raise GraphQL::ExecutionError, doc if doc.is_a? String

        { document: doc }
      end
    end
  end
end
