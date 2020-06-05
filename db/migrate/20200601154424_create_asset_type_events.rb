# frozen_string_literal: true

class CreateAssetTypeEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :asset_type_events, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.references :company, type: :uuid, null: false, foreign_key: true
      t.references :asset_type, type: :uuid, null: false, foreign_key: true
      t.references :event, type: :uuid, null: false, foreign_key: true
      t.decimal :quantity
      t.integer :discount

      t.timestamps
    end
  end
end
