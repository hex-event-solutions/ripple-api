# frozen_string_literal: true

module Mutations
  module AssetTypeSpecifications
    class Create < AuthorizedMutation
      include Helpers::Create

      argument :asset_type_id, ID, required: true
      argument :name, String, required: true
      argument :value, String, required: true

      field :asset_type_specification, Types::Ripple::AssetTypeSpecificationType, null: true

      def resolve(**params)
        specification = Specification.find_by(company_id: context[:company_id], name: params[:name])
        specification ||= Specification.create!(company_id: context[:company_id], name: params[:name])

        create_params = {
          asset_type_id: params[:asset_type_id],
          specification_id: specification.id,
          value: params[:value]
        }

        create(AssetTypeSpecification, context[:company_id], create_params)
      end
    end
  end
end
