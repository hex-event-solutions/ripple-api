# frozen_string_literal: true

class MaintenanceEvent < ApplicationRecord
  template_values details: 'Template maintenance event details'

  before_validation :set_maintenance_type, if: :maintenance_schedule

  has_many :maintenance_tasks

  belongs_to :company
  belongs_to :maintenance_schedule, optional: true
  belongs_to :maintenance_type
  belongs_to :maintenance_resolution
  belongs_to :asset

  alias_attribute :tasks, :maintenance_tasks

  default_scope { order(updated_at: :desc) }

  validates :company, :asset, :maintenance_resolution, presence: true

  private

  def set_maintenance_type
    self.maintenance_type_id = maintenance_schedule.maintenance_type_id
  end
end
