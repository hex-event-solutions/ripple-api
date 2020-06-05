# frozen_string_literal: true

class MaintenanceSchedule < ApplicationRecord
  has_many :maintenance_events

  belongs_to :asset_type
  belongs_to :maintenance_type

  validates :asset_type, :maintenance_type, :details, presence: true
end
