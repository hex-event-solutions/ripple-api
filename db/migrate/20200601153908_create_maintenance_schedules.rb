# frozen_string_literal: true

class CreateMaintenanceSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :maintenance_schedules, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.references :company, type: :uuid, null: false, foreign_key: true
      t.references :asset_type, type: :uuid, null: false, foreign_key: true
      t.references :maintenance_type, type: :uuid, null: false, foreign_key: true
      t.text :details

      t.timestamps
    end
  end
end
