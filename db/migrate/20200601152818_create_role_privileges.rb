# frozen_string_literal: true

class CreateRolePrivileges < ActiveRecord::Migration[6.0]
  def change
    create_table :role_privileges, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.references :company, type: :uuid, null: false, foreign_key: true
      t.references :role, type: :uuid, null: false, foreign_key: true
      t.string :action
      t.string :resource

      t.timestamps
    end
  end
end
