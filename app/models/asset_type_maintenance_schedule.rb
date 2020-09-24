# frozen_string_literal: true

class AssetTypeMaintenanceSchedule < ApplicationRecord
  belongs_to :company
  belongs_to :asset_type
  belongs_to :maintenance_schedule

  validates :company, :asset_type, :maintenance_schedule, presence: true

  default_scope { includes(:maintenance_schedule) }
end
