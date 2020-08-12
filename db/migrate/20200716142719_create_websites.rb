# frozen_string_literal: true

class CreateWebsites < ActiveRecord::Migration[6.0]
  def change
    create_table :websites, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.references :company, type: :uuid, null: false, foreign_key: true
      t.string :template
      t.string :styles

      t.timestamps
    end
  end
end
