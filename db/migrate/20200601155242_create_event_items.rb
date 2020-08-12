# frozen_string_literal: true

class CreateEventItems < ActiveRecord::Migration[6.0]
  def change
    create_table :event_items, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.references :company, type: :uuid, null: false, foreign_key: true
      t.references :event, type: :uuid, null: false
      t.references :item, type: :uuid, null: false, polymorphic: true, index: true
      t.decimal :quantity
      t.integer :discount
      t.boolean :template, null: false, default: false

      t.timestamps
    end
  end
end
