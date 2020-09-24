# frozen_string_literal: true

module Mutations
  module MaintenanceTasks
    class Create < AuthorizedMutation
      include Helpers::Create
      argument :maintenance_type_task_id, ID, required: true
      argument :maintenance_event_id, ID, required: true
      argument :result, String, required: true

      field :maintenance_task, Types::Ripple::MaintenanceTaskType, null: true

      def resolve(**params)
        create(MaintenanceTask, context[:company_id], params)
      end
    end
  end
end
