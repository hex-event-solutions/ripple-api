# frozen_string_literal: true

module Types
  module Ripple
    class MaintenanceTypeTaskType < Types::BaseObject
      field :name, String, null: false
      field :required, Boolean, null: false
      field :task_type, Types::Ripple::MaintenanceTypeTaskTaskTypeType, null: false

      field :values, [Types::Ripple::MaintenanceTypeTaskValueType], null: false
      field :tasks, [Types::Ripple::MaintenanceTaskType], null: false

      field :maintenance_type, Types::Ripple::MaintenanceTypeType, null: false
      field :maintenance_event, Types::Ripple::MaintenanceEventType, null: false
    end
  end
end
