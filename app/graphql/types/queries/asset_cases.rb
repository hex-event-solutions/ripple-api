# frozen_string_literal: true

module Types
  module Queries
    module AssetCases
      def self.included(base)
        base.field :asset_cases, [Types::Ripple::AssetCaseType], null: false, description: 'Returns all asset cases'
        base.field :asset_case, Types::Ripple::AssetCaseType, null: false, description: 'Returns an asset case' do
          argument :id, Types::BaseObject::ID, required: true
        end
      end

      def asset_cases
        AssetCase.where(company_id: context[:company_id]).without_templates
      end

      def asset_case(id:)
        AssetCase.find_by!(company_id: context[:company_id], id: id)
      end
    end
  end
end
