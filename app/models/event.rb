# frozen_string_literal: true

class Event < ApplicationRecord
  has_many :documents
  has_many :asset_events
  has_many :assets, through: :asset_events
  has_many :asset_type_events
  has_many :asset_types, through: :asset_type_events
  has_many :shifts

  belongs_to :client

  validates :client, :date_start, :date_end, :date_out, :date_return, :description, :location, presence: true
  validate :dates_are_possible?

  def dates_are_possible?
    current_order = [date_start, date_out, date_return, date_end]
    if current_order.none?(&:nil?)
      sorted_order = current_order.sort
      return if current_order == sorted_order
    end

    errors.add(:dates, 'date_start <= date_out <= date_return <= date_end')
  end
end
