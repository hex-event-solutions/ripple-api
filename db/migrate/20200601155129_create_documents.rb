# frozen_string_literal: true

class CreateDocuments < ActiveRecord::Migration[6.0]
  def change
    create_table :documents, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.references :company, type: :uuid, null: false, foreign_key: true
      t.references :document_type, type: :uuid, null: false, foreign_key: true
      t.integer :number, default: 0
      t.string :reference
      t.string :subject_id
      t.datetime :date_issued
      t.datetime :date_due
      t.boolean :template, null: false, default: false

      t.timestamps
    end
  end
end
