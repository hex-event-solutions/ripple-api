# frozen_string_literal: true

module Mutations
  module MaintenanceResolutions
    class Create < AuthorizedMutation
      include Helpers::Create

      argument :name, String, required: true

      field :maintenance_resolution, Types::RippleMaintenanceResolutionType, null: true

      def resolve(**params)
        create(MaintenanceResolution, context[:company_id], params)
      end
    end
  end
end
