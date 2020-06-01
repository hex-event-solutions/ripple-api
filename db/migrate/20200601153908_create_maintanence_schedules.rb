class CreateMaintanenceSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :maintanence_schedules do |t|
      t.references :asset_type, null: false, foreign_key: true
      t.integer :maintenance_type
      t.text :details

      t.timestamps
    end
  end
end
