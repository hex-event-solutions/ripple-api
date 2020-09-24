# frozen_string_literal: true

class MaintenanceTypeTask < ApplicationRecord
  template_values(
    name: 'Template task',
    task_type: 'text',
    required: false
  )

  has_many :maintenance_type_task_values, dependent: :destroy
  has_many :maintenance_tasks

  belongs_to :company
  belongs_to :maintenance_type

  alias_attribute :values, :maintenance_type_task_values
  alias_attribute :tasks, :maintenance_tasks
end
