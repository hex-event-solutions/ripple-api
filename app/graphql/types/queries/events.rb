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
        base.field :calendar, Types::Ripple::CalendarType, null: false, description: 'All events in the same month as a given date' do
          argument :date, GraphQL::Types::ISO8601DateTime, required: true
        end
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

      def calendar(date:)
        start_date = date.beginning_of_month
        end_date = date.end_of_month

        puts "Start date: #{start_date}, end date: #{end_date}"

        days = []
        (start_date.day..end_date.day).each do |day|
          days << {
            id: SecureRandom.uuid,
            date: start_date + (day - 1).days,
            events: []
          }
        end

        events = Event.where(company_id: context[:company_id])
                      .without_templates
                      .where('date_return >= ? AND date_out <= ?', start_date, end_date)
                      .order('(date_return - date_out) DESC')

        events.each do |event|
          offset = 0
          (event.date_out.to_i..event.date_return.to_i).step(1.day).each do |day_stamp|
            day = Time.at(day_stamp)

            # puts "Day: #{day}, start: #{start_date}, end: #{end_date}"

            next if day < start_date || day > end_date

            current_items = days[day.day - 1][:events].count

            offset = current_items if current_items > offset

            (current_items..offset).each do |item|
              days[day.day - 1][:events][item] = { id: SecureRandom.uuid, description: '' }
            end

            days[day.day - 1][:events][offset] = event
          end
        end

        {
          id: SecureRandom.uuid,
          date: date,
          days: days
        }
      end
    end
  end
end
