# frozen_string_literal: true

module Types
  module Queries
    module MultiplierTypes
      def self.included(base)
        base.field :multiplier_types,
                   [Types::Ripple::MultiplierTypeType],
                   null: false,
                   description: 'Returns all multiplier types'
      end

      def multiplier_types
        MultiplierType.where(company_id: context[:company_id]).without_templates
      end
    end
  end
end
