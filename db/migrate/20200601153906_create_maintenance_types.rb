# frozen_string_literal: true

class CreateMaintenanceTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :maintenance_types do |t|
      t.references :company, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
