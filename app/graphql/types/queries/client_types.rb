# frozen_string_literal: true

module Types
  module Queries
    module ClientTypes
      def self.included(base)
        base.field :client_types, [Types::Ripple::ClientTypeType], null: false, description: 'Returns all client types'
      end

      def client_types
        ClientType.where(company_id: context[:company_id]).without_templates
      end
    end
  end
end
