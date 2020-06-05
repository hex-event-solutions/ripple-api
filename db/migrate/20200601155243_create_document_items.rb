# frozen_string_literal: true

class CreateDocumentItems < ActiveRecord::Migration[6.0]
  def change
    create_table :document_items do |t|
      t.references :document, null: false
      t.references :item, null: false, foreign_key: true
      t.references :item_type, null: false, foreign_key: true
      t.decimal :quantity
      t.integer :discount

      t.timestamps
    end
  end
end
