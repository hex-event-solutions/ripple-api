# frozen_string_literal: true

class CreateShifts < ActiveRecord::Migration[6.0]
  def change
    create_table :shifts, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.references :company, type: :uuid, null: false, foreign_key: true
      t.references :event, type: :uuid, null: false, foreign_key: true
      t.string :crew_id, type: :uuid
      t.datetime :start
      t.datetime :finish
      t.decimal :rate
      t.decimal :price
      t.boolean :template, null: false, default: false

      t.timestamps
    end
  end
end
