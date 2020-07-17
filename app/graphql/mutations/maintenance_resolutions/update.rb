# frozen_string_literal: true

module Mutations
  module MaintenanceResolutions
    class Update < AuthorizedMutation
      include Helpers::Update

      argument :id, ID, required: true
      argument :name, String, required: true

      field :maintenance_resolution, Types::RippleMaintenanceResolutionType, null: true

      def resolve(id:, **params)
        update(MaintenanceResolution, id, params)
      end
    end
  end
end
