# frozen_string_literal: true

module Types
  module Queries
    module DocumentStates
      def self.included(base)
        base.field :document_states,
                   [Types::Ripple::DocumentStateType],
                   null: false,
                   description: 'Returns all document states'
      end

      def document_states
        DocumentState.where(company_id: context[:company_id]).without_templates
      end
    end
  end
end
