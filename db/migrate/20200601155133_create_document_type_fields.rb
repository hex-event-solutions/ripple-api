# frozen_string_literal: true

class CreateDocumentTypeFields < ActiveRecord::Migration[6.0]
  def change
    create_table :document_type_fields do |t|
      t.string :name
      t.string :object
      t.string :property
      t.references :document_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
