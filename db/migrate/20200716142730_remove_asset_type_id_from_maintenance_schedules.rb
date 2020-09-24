# frozen_string_literal: true

class RemoveAssetTypeIdFromMaintenanceSchedules < ActiveRecord::Migration[6.0]
  def change
    remove_column :maintenance_schedules, :asset_type_id, type: :uuid, null: false, foreign_key: true
  end
end
