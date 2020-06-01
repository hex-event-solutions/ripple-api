class CreateAssets < ActiveRecord::Migration[6.0]
  def change
    create_table :assets do |t|
      t.references :asset_type, null: false, foreign_key: true
      t.string :barcode
      t.references :case, null: false, foreign_key: true

      t.timestamps
    end
  end
end
