# frozen_string_literal: true

class CreateMaintenanceTypeTaskValues < ActiveRecord::Migration[6.0]
  def change
    create_table :maintenance_type_task_values, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.references :company, type: :uuid, null: false, foreign_key: true
      t.references :maintenance_type_task, type: :uuid, null: false, foreign_key: true
      t.string :value
      t.boolean :template, null: false, default: false

      t.timestamps
    end
  end
end
