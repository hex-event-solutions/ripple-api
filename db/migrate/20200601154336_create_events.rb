# frozen_string_literal: true

class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.references :company, type: :uuid, null: false, foreign_key: true
      t.datetime :date_start
      t.datetime :date_end
      t.datetime :date_out
      t.datetime :date_return
      t.references :client, type: :uuid, null: false, foreign_key: true
      t.string :description
      t.text :details
      t.text :location
      t.boolean :template, null: false, default: false

      t.timestamps
    end
  end
end
