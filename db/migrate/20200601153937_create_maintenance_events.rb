class CreateMaintenanceEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :maintenance_events do |t|
      t.references :maintenance_schedule, null: false, foreign_key: true
      t.references :asset, null: false, foreign_key: true
      t.text :details
      t.references :maintenance_resolution, null: false, foreign_key: true

      t.timestamps
    end
  end
end
