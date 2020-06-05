# frozen_string_literal: true

class MaintenanceType < ApplicationRecord
  has_many :maintenance_schedules

  validates :name, presence: true, length: { maximum: 32 }, uniqueness: true
end
