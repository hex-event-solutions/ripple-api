class CreateAccessories < ActiveRecord::Migration[6.0]
  def change
    create_table :accessories do |t|
      t.references :asset_type, null: false, foreign_key: true
      t.integer :accessory_asset_type_id
      t.decimal :quantity

      t.timestamps
    end
  end
end
