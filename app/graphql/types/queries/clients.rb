# frozen_string_literal: true

module Types
  module Queries
    module Clients
      def self.included(base)
        base.field :clients, [Types::Ripple::ClientType], null: false, description: 'Returns all clients'
        base.field :client, Types::Ripple::ClientType, null: false, description: 'A client' do
          argument :id, Types::BaseObject::ID, required: true
        end
      end

      def clients
        Client.where(company_id: context[:company_id]).without_templates
      end

      def client(id:)
        Client.find_by!(company_id: context[:company_id], id: id)
      end
    end
  end
end
