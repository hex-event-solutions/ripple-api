# frozen_string_literal: true

module Types
  module Queries
    module AssetTypes
      def self.included(base)
        base.field :asset_types, [Types::Ripple::AssetTypeType], null: false, description: 'Returns all asset types'

        base.field :asset_type, Types::Ripple::AssetTypeType, null: false, description: 'Returns an asset type' do
          argument :id, Types::BaseObject::ID, required: true
        end

        base.field :available_accessories,
                   [Types::Ripple::AssetTypeType],
                   null: false,
                   description: 'Returns available accessories for an asset type' do
          argument :asset_type_id, Types::BaseObject::ID, required: true
        end

        base.field :available_categories,
                   [Types::Ripple::CategoryType],
                   null: false,
                   description: 'Returns available categories for an asset type' do
          argument :asset_type_id, Types::BaseObject::ID, required: true
        end

        base.field :available_multiplier_types,
                   [Types::Ripple::MultiplierTypeType],
                   null: false,
                   description: 'Returns available multiplier types for a given asset type' do
          argument :asset_type_id, Types::BaseObject::ID, required: true
        end

        base.field :available_specifications,
                   [Types::Ripple::SpecificationType],
                   null: false,
                   description: 'Returns available specifications for a given asset type' do
          argument :asset_type_id, Types::BaseObject::ID, required: true
        end

        base.field :manufacturers, [String], null: false, description: 'Returns all manufacturers'

        base.field :models, [String], null: false, description: 'Returns all models for a manufacturer' do
          argument :manufacturer, String, required: true
        end
      end

      def asset_types
        AssetType.includes(:asset_type_categories, :asset_type_multiplier_types)
                 .where(company_id: context[:company_id])
                 .without_templates
      end

      def asset_type(id:)
        AssetType.find_by!(company_id: context[:company_id], id: id)
      end

      def available_accessories(asset_type_id:)
        AssetType.find_by!(company_id: context[:company_id], id: asset_type_id).available_accessories
      end

      def available_categories(asset_type_id:)
        AssetType.find_by!(company_id: context[:company_id], id: asset_type_id).available_categories
      end

      def available_multiplier_types(asset_type_id:)
        AssetType.find_by!(company_id: context[:company_id], id: asset_type_id).available_multiplier_types
      end

      def available_specifications(asset_type_id:)
        AssetType.find_by!(company_id: context[:company_id], id: asset_type_id).available_specifications
      end

      def manufacturers
        AssetType.where(company_id: context[:company_id]).without_templates.distinct.pluck(:manufacturer)
      end

      def models(manufacturer:)
        AssetType.where(company_id: context[:company_id], manufacturer: manufacturer).distinct.pluck(:model)
      end
    end
  end
end
