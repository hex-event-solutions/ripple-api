# frozen_string_literal: true

class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.references :company, null: false, foreign_key: true
      t.string :name
      t.string :fullname
      t.references :parent, index: true

      t.timestamps
    end
  end
end
