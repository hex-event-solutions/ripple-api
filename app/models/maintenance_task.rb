# frozen_string_literal: true

class MaintenanceTask < ApplicationRecord
  template_values(
    result: 'Template result'
  )

  belongs_to :company
  belongs_to :maintenance_type_task
  belongs_to :maintenance_event
end
