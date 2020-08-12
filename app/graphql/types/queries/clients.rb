# frozen_string_literal: true

module Types
  module Queries
    module Clients
      def self.included(base)
        base.field :clients, [Types::Ripple::ClientType], null: false, description: 'Returns all clients'
      end

      def clients
        Client.where(company_id: context[:company_id]).without_templates
      end
    end
  end
end
