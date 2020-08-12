# frozen_string_literal: true

module Mutations
  module AssetTypeMultiplierTypes
    class Create < AuthorizedMutation
      include Helpers::Create

      argument :asset_type_id, ID, required: true
      argument :multiplier_type_id, ID, required: true

      field :asset_type_multiplier_type, Types::Ripple::AssetTypeMultiplierTypeType, null: true

      def resolve(**params)
        create(AssetTypeMultiplierType, context[:company_id], params)
      end
    end
  end
end
