# frozen_string_literal: true

class CreateAssets < ActiveRecord::Migration[6.0]
  def change
    create_table :assets do |t|
      t.references :company, null: false, foreign_key: true
      t.references :asset_type, null: false, foreign_key: true
      t.string :barcode
      t.references :asset_case, null: false, foreign_key: true

      t.timestamps
    end
  end
end
