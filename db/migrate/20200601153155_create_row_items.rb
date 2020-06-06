# frozen_string_literal: true

class CreateRowItems < ActiveRecord::Migration[6.0]
  def change
    create_table :row_items, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.references :company, type: :uuid, null: false, foreign_key: true
      t.decimal :price
      t.string :description

      t.timestamps
    end
  end
end
