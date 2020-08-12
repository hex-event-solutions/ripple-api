# frozen_string_literal: true

module Mutations
  module Documents
    class Generate < AuthorizedMutation
      argument :id, String, required: true

      field :document, Types::Ripple::DocumentAttachmentType, null: true

      def resolve(**params)
        doc = Document.find_by(company_id: context[:company_id], id: params[:id]).generate

        { document: doc }
      end
    end
  end
end
