# frozen_string_literal: true

module Types
  module Ripple
    class MaintenanceTypeTaskValueType < Types::BaseObject
      field :value, String, null: false

      field :maintenance_type_task, Types::Ripple::MaintenanceTypeTaskType, null: false
    end
  end
end
