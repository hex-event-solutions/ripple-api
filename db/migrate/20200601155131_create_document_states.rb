# frozen_string_literal: true

class CreateDocumentStates < ActiveRecord::Migration[6.0]
  def change
    create_table :document_states do |t|
      t.string :name

      t.timestamps
    end
  end
end
