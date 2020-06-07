# frozen_string_literal: true

class CreateDocumentTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :document_types, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.references :company, type: :uuid, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end