# frozen_string_literal: true

class MaintenanceType < ApplicationRecord
  has_many :maintenance_schedules

  belongs_to :company

  validates :company, :name, presence: true
  validates :name, length: { maximum: 32 }, uniqueness: { scope: :company_id }
end
