# frozen_string_literal: true

class CreateMaintenanceSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :maintenance_schedules do |t|
      t.references :company, null: false, foreign_key: true
      t.references :asset_type, null: false, foreign_key: true
      t.references :maintenance_type, null: false, foreign_key: true
      t.text :details

      t.timestamps
    end
  end
end
