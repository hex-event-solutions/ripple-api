class MaintenanceSchedule < ApplicationRecord
  belongs_to :asset_type
  belongs_to :maintenance_type

end
