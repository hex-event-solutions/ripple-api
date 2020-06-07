# frozen_string_literal: true

class CreateAssets < ActiveRecord::Migration[6.0]
  def change
    create_table :assets, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.references :company, type: :uuid, null: false, foreign_key: true
      t.references :asset_type, type: :uuid, null: false, foreign_key: true
      t.string :barcode
      t.references :asset_case, type: :uuid, foreign_key: true

      t.timestamps
    end
  end
end
