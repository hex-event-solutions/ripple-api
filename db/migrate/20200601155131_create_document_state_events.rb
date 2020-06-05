# frozen_string_literal: true

class CreateDocumentStateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :document_state_events do |t|
      t.references :document_state, null: false, foreign_key: true
      t.references :document, null: false, foreign_key: true
      t.string :details

      t.timestamps
    end
  end
end
