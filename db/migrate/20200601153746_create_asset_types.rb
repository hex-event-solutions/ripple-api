# frozen_string_literal: true

class CreateAssetTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :asset_types, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.references :company, type: :uuid, null: false, foreign_key: true
      t.decimal :cost
      t.decimal :rate
      t.boolean :display_on_website
      t.string :manufacturer
      t.string :model
      t.decimal :weight
      t.string :description
      t.boolean :template, null: false, default: false

      t.timestamps
    end
  end
end
