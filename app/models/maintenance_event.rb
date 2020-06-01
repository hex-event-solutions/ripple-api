class MaintenanceEvent < ApplicationRecord
  belongs_to :maintenance_schedule
  belongs_to :asset
end
