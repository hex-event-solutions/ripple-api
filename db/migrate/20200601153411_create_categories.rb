# frozen_string_literal: true

class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.references :company, type: :uuid, null: false, foreign_key: true
      t.references :parent, type: :uuid, index: true
      t.string :name
      t.string :fullname
      t.boolean :template, null: false, default: false

      t.timestamps
    end
  end
end
