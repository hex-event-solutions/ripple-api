# frozen_string_literal: true

class MaintenanceEvent < ApplicationRecord
  template_values details: 'Template maintenance event details'

  has_many :maintenance_tasks

  belongs_to :company
  belongs_to :maintenance_schedule, optional: true
  belongs_to :maintenance_type
  belongs_to :maintenance_resolution
  belongs_to :asset

  alias_attribute :tasks, :maintenance_tasks

  default_scope { order(updated_at: :desc) }

  validates :company, :asset, :maintenance_resolution, presence: true
end
