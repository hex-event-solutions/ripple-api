# frozen_string_literal: true

class CreateMaintenanceEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :maintenance_events, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.references :company, type: :uuid, null: false, foreign_key: true
      t.references :maintenance_schedule, type: :uuid, foreign_key: true
      t.references :maintenance_type, type: :uuid, foreign_key: true
      t.references :asset, type: :uuid, null: false, foreign_key: true
      t.references :maintenance_resolution, type: :uuid, null: false, foreign_key: true
      t.text :details
      t.boolean :template, null: false, default: false

      t.timestamps
    end
  end
end
