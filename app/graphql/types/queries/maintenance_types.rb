# frozen_string_literal: true

module Types
  module Queries
    module MaintenanceTypes
      def self.included(base)
        base.field :maintenance_types,
                   [Types::Ripple::MaintenanceTypeType],
                   null: false,
                   description: 'Returns all maintenance types'
      end

      def maintenance_types
        MaintenanceType.where(company_id: context[:company_id]).without_templates
      end
    end
  end
end
