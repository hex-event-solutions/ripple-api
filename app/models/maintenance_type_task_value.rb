# frozen_string_literal: true

class MaintenanceTypeTaskValue < ApplicationRecord
  template_values(
    value: 'Template value'
  )

  belongs_to :company
  belongs_to :maintenance_type_task
end
