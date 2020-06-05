# frozen_string_literal: true

class CreateDocuments < ActiveRecord::Migration[6.0]
  def change
    create_table :documents do |t|
      t.integer :event_id
      t.references :client, null: false, foreign_key: true
      t.references :document_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
