# frozen_string_literal: true

class CreateAssetTypeMaintenanceSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :asset_type_maintenance_schedules, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.references :company, type: :uuid, null: false, foreign_key: true
      t.references :asset_type, type: :uuid, null: false, foreign_key: true
      t.references :maintenance_schedule, type: :uuid, null: false, foreign_key: true, index: { name: 'index_asset_type_maint_schedules_on_maint_schedule_id' }
      t.boolean :template, null: false, default: false

      t.timestamps
    end
  end
end
