# frozen_string_literal: true

class CreateAssetCases < ActiveRecord::Migration[6.0]
  def change
    create_table :asset_cases, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.references :company, type: :uuid, null: false, foreign_key: true
      t.string :barcode

      t.timestamps
    end
  end
end
