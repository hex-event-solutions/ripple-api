# frozen_string_literal: true

module Types
  module Queries
    module MaintenanceSchedules
      def self.included(base)
        base.field :maintenance_schedule,
                   Types::Ripple::MaintenanceScheduleType,
                   null: false,
                   description: 'Returns a maintenance schedule' do
          argument :id, Types::BaseObject::ID, required: true
        end
      end

      def maintenance_schedule(id:)
        MaintenanceSchedule.with(context[:company_id]).find(id)
      end
    end
  end
end
