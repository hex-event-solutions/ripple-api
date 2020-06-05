# frozen_string_literal: true

class CreateAssetTypeCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :asset_type_categories, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.references :company, type: :uuid, null: false, foreign_key: true
      t.references :asset_type, type: :uuid, null: false, foreign_key: true
      t.references :category, type: :uuid, null: false, foreign_key: true

      t.timestamps
    end
  end
end
