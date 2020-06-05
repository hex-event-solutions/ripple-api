# frozen_string_literal: true

class CreateDocumentItems < ActiveRecord::Migration[6.0]
  def change
    create_table :document_items, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.references :company, type: :uuid, null: false, foreign_key: true
      t.references :document, type: :uuid, null: false
      t.references :item, type: :uuid, null: false, foreign_key: true
      t.references :item_type, type: :uuid, null: false, foreign_key: true
      t.decimal :quantity
      t.integer :discount

      t.timestamps
    end
  end
end
