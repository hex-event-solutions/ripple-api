# frozen_string_literal: true

class CreateAssetTypeEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :asset_type_events do |t|
      t.references :asset_type, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true
      t.decimal :quantity
      t.integer :discount

      t.timestamps
    end
  end
end
