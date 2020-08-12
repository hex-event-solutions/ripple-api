# frozen_string_literal: true

class CreateAssetTypeSpecifications < ActiveRecord::Migration[6.0]
  def change
    create_table :asset_type_specifications, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.references :company, type: :uuid, null: false, foreign_key: true
      t.references :asset_type, type: :uuid, null: false, foreign_key: true
      t.references :specification, type: :uuid, null: false, foreign_key: true
      t.string :value
      t.boolean :template, null: false, default: false

      t.timestamps
    end
  end
end
