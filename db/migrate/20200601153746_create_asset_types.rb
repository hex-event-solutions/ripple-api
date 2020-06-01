class CreateAssetTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :asset_types do |t|
      t.decimal :cost
      t.decimal :rate
      t.integer :rate_multiplier
      t.boolean :display_on_website
      t.string :manufacturer
      t.string :model
      t.decimal :weight
      t.string :description

      t.timestamps
    end
  end
end
