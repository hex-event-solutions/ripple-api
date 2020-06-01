class CreateCrewRoles < ActiveRecord::Migration[6.0]
  def change
    create_table :crew_roles do |t|
      t.references :crew, null: false, foreign_key: true
      t.references :role, null: false, foreign_key: true

      t.timestamps
    end
  end
end
