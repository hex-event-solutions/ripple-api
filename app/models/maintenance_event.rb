# frozen_string_literal: true

class MaintenanceEvent < ApplicationRecord
  template_values details: 'Template maintenance event details'

  belongs_to :company
  belongs_to :maintenance_schedule, optional: true
  belongs_to :maintenance_type, optional: true
  belongs_to :maintenance_resolution
  belongs_to :asset

  validates :company, :asset, :maintenance_resolution, presence: true
end
