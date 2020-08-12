# frozen_string_literal: true

module Types
  module Ripple
    class MaintenanceResolutionType < Types::BaseObject
      field :name, String, null: false

      field :maintenance_events, [Types::Ripple::MaintenanceEventType], null: true
    end
  end
end
