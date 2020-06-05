# frozen_string_literal: true

class CreateCrews < ActiveRecord::Migration[6.0]
  def change
    create_table :crews, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.references :company, type: :uuid, null: false, foreign_key: true
      t.string :name
      t.string :email
      t.decimal :rate
      t.decimal :price
      t.string :password_digest

      t.timestamps
    end
  end
end
