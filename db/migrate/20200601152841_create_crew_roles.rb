# frozen_string_literal: true

class CreateCrewRoles < ActiveRecord::Migration[6.0]
  def change
    create_table :crew_roles, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.references :company, type: :uuid, null: false, foreign_key: true
      t.references :crew, type: :uuid, null: false, foreign_key: true
      t.references :role, type: :uuid, null: false, foreign_key: true

      t.timestamps
    end
  end
end
