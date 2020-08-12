# frozen_string_literal: true

class CreateDocumentTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :document_types, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.references :company, type: :uuid, null: false, foreign_key: true
      t.string :content
      t.string :header
      t.string :footer
      t.string :styles
      t.string :name
      t.string :subject
      t.string :increment_pattern
      t.integer :increment_start, default: 1
      t.boolean :incremental, null: false, default: false
      t.boolean :date_due, null: false, default: false
      t.boolean :date_issued, null: false, default: false
      t.boolean :template, null: false, default: false

      t.timestamps
    end
  end
end
