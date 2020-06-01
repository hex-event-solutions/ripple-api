class CreateAssetTypeCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :asset_type_categories do |t|
      t.references :asset_type, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
