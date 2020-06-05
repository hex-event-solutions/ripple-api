# frozen_string_literal: true

class CreateAssetCases < ActiveRecord::Migration[6.0]
  def change
    create_table :asset_cases do |t|
      t.string :barcode

      t.timestamps
    end
  end
end
