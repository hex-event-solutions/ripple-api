# frozen_string_literal: true

module Mutations
  module MaintenanceEvents
    class Create < AuthorizedMutation
      include Helpers::Create

      argument :asset_id, ID, required: true
      argument :details, String, required: false
      argument :maintenance_schedule_id, ID, required: false
      argument :maintenance_type_id, ID, required: false
      argument :maintenance_resolution_id, ID, required: true

      field :maintenance_event, Types::Ripple::MaintenanceEventType, null: true

      def resolve(**params)

        create(MaintenanceEvent, context[:company_id], params)
      end
    end
  end
end
