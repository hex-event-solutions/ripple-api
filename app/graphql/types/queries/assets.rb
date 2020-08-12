# frozen_string_literal: true

module Types
  module Queries
    module Assets
      def self.included(base)
        base.field :assets, [Types::Ripple::AssetType], null: false, description: 'Returns all assets'
        base.field :asset, Types::Ripple::AssetType, null: false, description: 'Returns an asset' do
          argument :id, Types::BaseObject::ID, required: true
        end
      end

      def assets
        Asset.where(company_id: context[:company_id]).without_templates
      end

      def asset(id:)
        Asset.find_by!(company_id: context[:company_id], id: id)
      end
    end
  end
end
