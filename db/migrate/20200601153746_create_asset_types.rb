# frozen_string_literal: true

class CreateAssetTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :asset_types, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.references :company, type: :uuid, null: false, foreign_key: true
      t.decimal :cost
      t.decimal :rate
      t.references :multiplier_type, type: :uuid, null: false, foreign_key: true
      t.boolean :display_on_website
      t.string :manufacturer
      t.string :model
      t.decimal :weight
      t.string :description

      t.timestamps
    end
  end
end
