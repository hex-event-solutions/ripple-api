# frozen_string_literal: true

class CreateDocumentTypeFields < ActiveRecord::Migration[6.0]
  def change
    create_table :document_type_fields, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.references :company, type: :uuid, null: false, foreign_key: true
      t.string :name
      t.string :resource
      t.string :property
      t.references :document_type, type: :uuid, null: false, foreign_key: true

      t.timestamps
    end
  end
end
