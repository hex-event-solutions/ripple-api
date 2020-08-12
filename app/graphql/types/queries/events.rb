# frozen_string_literal: true

module Types
  module Queries
    module Events
      def self.included(base)
        base.field :events, [Types::Ripple::EventType], null: false, description: 'Returns all events'
        base.field :event, Types::Ripple::EventType, null: false, description: 'Returns one event' do
          argument :id, Types::BaseObject::ID, required: true
        end
        base.field :locations, [String], null: true, description: 'Returns all locations'
      end

      def events
        Event.where(company_id: context[:company_id]).without_templates
      end

      def event(id:)
        Event.find_by!(company_id: context[:company_id], id: id)
      end

      def locations
        Event.where(company_id: context[:company_id]).without_templates.distinct.pluck(:location)
      end
    end
  end
end
