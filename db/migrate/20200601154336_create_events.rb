# frozen_string_literal: true

class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.references :company, null: false, foreign_key: true
      t.datetime :date_start
      t.datetime :date_end
      t.datetime :date_out
      t.datetime :date_return
      t.references :client, null: false, foreign_key: true
      t.string :description
      t.text :details
      t.text :location

      t.timestamps
    end
  end
end
