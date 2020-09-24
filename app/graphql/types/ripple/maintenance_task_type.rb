# frozen_string_literal: true

module Types
  module Ripple
    class MaintenanceTaskType < Types::BaseObject
      field :result, String, null: false

      field :maintenance_type_task, Types::Ripple::MaintenanceTypeTaskType, null: false
      field :maintenance_event, Types::Ripple::MaintenanceEventType, null: false
    end
  end
end
