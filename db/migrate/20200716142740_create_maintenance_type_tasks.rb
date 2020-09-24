# frozen_string_literal: true

class CreateMaintenanceTypeTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :maintenance_type_tasks, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.references :company, type: :uuid, null: false, foreign_key: true
      t.references :maintenance_type, type: :uuid, null: false, foreign_key: true
      t.string :name
      t.string :task_type
      t.boolean :required
      t.boolean :template, null: false, default: false

      t.timestamps
    end
  end
end
