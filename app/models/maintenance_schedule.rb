class MaintenanceSchedule < ApplicationRecord
  belongs_to :asset_type

  enum maintenance_type: %i[pat repair preventative investigative]
end
