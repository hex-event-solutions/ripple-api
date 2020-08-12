# frozen_string_literal: true

class MaintenanceSchedule < ApplicationRecord
  include Documents

  template_values(
    details: 'Template maintenance schedule details',
    repeat_multiplier: 3,
    repeat_period: 'month'
  )

  has_many :maintenance_events, dependent: :destroy

  belongs_to :company
  belongs_to :asset_type
  belongs_to :maintenance_type

  validates :company, :asset_type, :maintenance_type, :repeat_multiplier, :repeat_period, presence: true
  validates :repeat_multiplier, numericality: true
end
