# frozen_string_literal: true

module Mutations
  module AssetTypeCategories
    class Create < AuthorizedMutation
      include Helpers::Create

      argument :asset_type_id, ID, required: true
      argument :category_id, ID, required: true

      field :asset_type_category, Types::Ripple::AssetTypeCategoryType, null: true

      def resolve(**params)
        create(AssetTypeCategory, context[:company_id], params)
      end
    end
  end
end
