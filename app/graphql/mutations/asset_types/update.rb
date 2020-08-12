# frozen_string_literal: true

module Mutations
  module AssetTypes
    class Update < AuthorizedMutation
      include Helpers::Update

      argument :id, ID, required: true
      argument :manufacturer, String, required: true
      argument :model, String, required: true
      argument :rate, Float, required: true
      argument :cost, Float, required: true
      argument :weight, Float, required: true
      argument :display_on_website, Boolean, required: true
      argument :description, String, required: true

      field :asset_type, Types::Ripple::AssetTypeType, null: true

      def resolve(id:, **params)
        update(AssetType, id, params)
      end
    end
  end
end
