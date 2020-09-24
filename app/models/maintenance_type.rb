# frozen_string_literal: true

class MaintenanceType < ApplicationRecord
  has_many :maintenance_schedules
  has_many :maintenence_events
  has_many :maintenance_type_tasks

  belongs_to :company

  alias_attribute :tasks, :maintenance_type_tasks

  validates :company, :name, presence: true
  validates :name, length: { maximum: 32 }, uniqueness: { scope: :company_id }
end
