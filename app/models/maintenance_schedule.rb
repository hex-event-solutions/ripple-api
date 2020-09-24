# frozen_string_literal: true

class MaintenanceSchedule < ApplicationRecord
  include Documents

  template_values(
    details: 'Template maintenance schedule details',
    repeat_multiplier: 3,
    repeat_period: 'month'
  )

  has_many :maintenance_events, dependent: :destroy
  has_many :asset_type_maintenance_schedules, dependent: :destroy

  belongs_to :company
  belongs_to :maintenance_type

  validates :company, :maintenance_type, :repeat_multiplier, :repeat_period, presence: true
  validates :repeat_multiplier, numericality: true

  def summary
    "#{maintenance_type.name} - Every #{repeat_multiplier} #{repeat_period}"
  end

  def last_event_for(asset_id)
    maintenance_events.where(asset_id: asset_id).order(updated_at: :desc).limit(1).first
  end
end
