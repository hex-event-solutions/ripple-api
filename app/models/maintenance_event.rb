class MaintenanceEvent < ApplicationRecord
  belongs_to :maintenance_schedule
  belongs_to :asset

  enum state: %i[disposed under_investigation completed will_not_repair]
end
