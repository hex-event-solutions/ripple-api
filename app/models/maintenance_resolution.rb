# frozen_string_literal: true

class MaintenanceResolution < ApplicationRecord
  has_many :maintenance_events

  validates :name, presence: true, length: { maximum: 32 }, uniqueness: true
end
