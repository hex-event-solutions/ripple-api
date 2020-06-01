# frozen_string_literal: true

class CreateShifts < ActiveRecord::Migration[6.0]
  def change
    create_table :shifts do |t|
      t.references :crew, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true
      t.datetime :start
      t.datetime :finish
      t.decimal :rate
      t.decimal :price

      t.timestamps
    end
  end
end
