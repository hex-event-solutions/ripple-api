class CreateAssetTypeSpecifications < ActiveRecord::Migration[6.0]
  def change
    create_table :asset_type_specifications do |t|
      t.references :asset_type, null: false, foreign_key: true
      t.references :specification, null: false, foreign_key: true
      t.string :value

      t.timestamps
    end
  end
end
