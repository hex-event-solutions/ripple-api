# frozen_string_literal: true

module Types
  class RippleMaintenanceResolutionType < Types::BaseObject
    field :name, String, null: false

    field :maintenance_events, [Types::RippleMaintenanceEventType], null: true
  end
end
