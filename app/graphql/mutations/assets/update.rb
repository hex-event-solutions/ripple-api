# frozen_string_literal: true

module Mutations
  module Assets
    class Update < AuthorizedMutation
      include Helpers::Update

      argument :id, ID, required: true
      argument :asset_type_id, ID, required: true
      argument :asset_case_id, ID, required: false

      field :asset, Types::Ripple::AssetType, null: true

      def resolve(id:, **params)
        unless params[:asset_case_id]
          asset_case = AssetCase.create!(company_id: context[:company_id])
          params[:asset_case_id] = asset_case.id
        end

        update(Asset, id, params)
      end
    end
  end
end
