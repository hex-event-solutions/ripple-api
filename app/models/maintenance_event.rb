# frozen_string_literal: true

class MaintenanceEvent < ApplicationRecord
  belongs_to :company
  belongs_to :maintenance_schedule
  belongs_to :maintenance_resolution
  belongs_to :asset

  validates :company, :maintenance_schedule, :asset, :details, :maintenance_resolution, presence: true
end
