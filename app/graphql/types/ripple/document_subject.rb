# frozen_string_literal: true

module Types
  module Ripple
    class DocumentSubject < Types::BaseUnion
      description 'Objects which may be linked to documents'
      possible_types(
        Types::Ripple::AssetType,
        Types::Ripple::AssetCaseType,
        Types::Ripple::AssetTypeType,
        Types::Ripple::CategoryType,
        Types::Ripple::ClientType,
        Types::Ripple::EventType,
        Types::Ripple::MaintenanceEventType,
        Types::Ripple::MaintenanceScheduleType,
        Types::Ripple::ShiftType
      )

      def self.resolve_type(object, _context)
        types[object.class.name]
      end

      def types
        {
          'Asset' => Types::Ripple::AssetType,
          'AssetCase' => Types::Ripple::AssetCaseType,
          'AssetType' => Types::Ripple::AssetTypeType,
          'Category' => Types::Ripple::CategoryType,
          'Client' => Types::Ripple::ClientType,
          'Event' => Types::Ripple::EventType,
          'MaintenanceEvent' => Types::Ripple::MaintenanceEventType,
          'MaintenanceSchedule' => Types::Ripple::MaintenanceScheduleType,
          'Shift' => Types::Ripple::ShiftType
        }
      end
    end
  end
end
