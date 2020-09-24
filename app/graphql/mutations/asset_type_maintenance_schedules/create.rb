# frozen_string_literal: true

module Mutations
  module AssetTypeMaintenanceSchedules
    class Create < AuthorizedMutation
      include Helpers::Create

      argument :asset_type_id, ID, required: true
      argument :maintenance_schedule_id, ID, required: true

      field :asset_type_maintenance_schedule, Types::Ripple::AssetTypeMaintenanceScheduleType, null: true

      def resolve(**params)
        create(AssetTypeMaintenanceSchedule, context[:company_id], params)
      end
    end
  end
end
