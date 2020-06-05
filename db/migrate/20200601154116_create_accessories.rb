# frozen_string_literal: true

class CreateAccessories < ActiveRecord::Migration[6.0]
  def change
    create_table :accessories, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.references :company, type: :uuid, null: false, foreign_key: true
      t.references :asset_type, type: :uuid, null: false, foreign_key: true
      t.integer :accessory_asset_type_id
      t.decimal :quantity

      t.timestamps
    end
  end
end
