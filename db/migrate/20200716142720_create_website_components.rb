# frozen_string_literal: true

class CreateWebsiteComponents < ActiveRecord::Migration[6.0]
  def change
    create_table :website_components, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.references :company, type: :uuid, null: false, foreign_key: true
      t.references :website, type: :uuid, null: false, foreign_key: true
      t.string :name
      t.string :component_type
      t.string :template

      t.timestamps
    end
  end
end
