# frozen_string_literal: true

module Mutations
  module Assets
    class Create < AuthorizedMutation
      include Helpers::Create

      argument :asset_type_id, ID, required: true
      argument :asset_case_id, ID, required: false
      argument :barcode, String, required: false
      argument :quantity, Integer, required: true

      field :assets, [Types::Ripple::AssetType], null: false

      def resolve(**params)
        unless params[:asset_case_id]
          asset_case = AssetCase.create!(company_id: context[:company_id])
          params[:asset_case_id] = asset_case.id
        end

        params[:company_id] = context[:company_id]
        quantity = params[:quantity]
        params.delete :quantity

        return { assets: [Asset.create!(params)] } if params[:barcode]

        full_params = [params] * quantity

        { assets: Asset.create!(full_params) }
      rescue ActiveRecord::ActiveRecordError => e
        raise GraphQL::ExecutionError, e.message
      end
    end
  end
end
