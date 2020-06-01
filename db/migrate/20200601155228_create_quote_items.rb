class CreateQuoteItems < ActiveRecord::Migration[6.0]
  def change
    create_table :quote_items do |t|
      t.references :quote, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true
      t.references :item_type, null: false, foreign_key: true
      t.decimal :quantity
      t.integer :discount

      t.timestamps
    end
  end
end
