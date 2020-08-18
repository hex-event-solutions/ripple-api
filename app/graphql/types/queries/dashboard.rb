# frozen_string_literal: true

module Types
  module Queries
    module Dashboard
      def self.included(base)
        base.field :upcoming_events, GraphQL::Types::Int, null: false, description: 'Count of upcoming events'
        base.field :events_today, GraphQL::Types::Int, null: false, description: 'Count of events today'
        base.field :unpaid_invoices, GraphQL::Types::Int, null: false, description: 'Count of unpaid invoices'
        base.field :overdue_invoices, GraphQL::Types::Int, null: false, description: 'Count of overdue invoices'
        base.field :upcoming_returns, GraphQL::Types::Int, null: false, description: 'Count of upcoming returns'
        base.field :returns_today, GraphQL::Types::Int, null: false, description: 'Count of returns today'
        base.field :overdue_returns, GraphQL::Types::Int, null: false, description: 'Count of overdue returns'
        base.field :equipment_shortages, GraphQL::Types::Int, null: false, description: 'Count of equipment shortages'
      end

      def upcoming_events
        Event.with(context[:company_id]).where('date_out >= ?', Time.now).count
      end

      def events_today
        start_date = Time.now.beginning_of_day
        end_date = Time.now.end_of_day
        Event.with(context[:company_id]).where('date_return >= ? AND date_out <= ?', start_date, end_date).count
      end

      def unpaid_invoices
        4
      end

      def overdue_invoices
        1
      end

      def upcoming_returns
        2
      end

      def returns_today
        2
      end

      def overdue_returns
        1
      end

      def equipment_shortages
        0
      end
    end
  end
end
