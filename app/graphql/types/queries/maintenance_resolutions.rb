# frozen_string_literal: true

module Types
  module Queries
    module MaintenanceResolutions
      def self.included(base)
        base.field :maintenance_resolutions,
                   [Types::Ripple::MaintenanceResolutionType],
                   null: false,
                   description: 'Returns all maintenance resolutions'
      end

      def maintenance_resolutions
        MaintenanceResolution.where(company_id: context[:company_id]).without_templates
      end
    end
  end
end
