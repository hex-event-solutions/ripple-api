# frozen_string_literal: true

module Types
  module Queries
    module Specifications
      def self.included(base)
        base.field :specifications,
                   [Types::Ripple::SpecificationType],
                   null: false,
                   description: 'Returns all specificaions'

        base.field :specification_values,
                   [String],
                   null: true,
                   description: 'Returns all existing specification values' do
          argument :name, String, required: true
        end
      end

      def specifications
        Specification.where(company_id: context[:company_id]).without_templates
      end

      def specification_values(name:)
        specification = Specification.find_by(company_id: context[:company_id], name: name)
        return [] unless specification

        AssetTypeSpecification.where(
          company_id: context[:company_id],
          specification_id: specification.id
        ).map(&:value).uniq
      end
    end
  end
end
