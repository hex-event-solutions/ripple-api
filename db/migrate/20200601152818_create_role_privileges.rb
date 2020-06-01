class CreateRolePrivileges < ActiveRecord::Migration[6.0]
  def change
    create_table :role_privileges do |t|
      t.references :role, null: false, foreign_key: true
      t.string :action
      t.string :resource

      t.timestamps
    end
  end
end
