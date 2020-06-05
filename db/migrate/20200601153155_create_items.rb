# frozen_string_literal: true

class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :company, null: false, foreign_key: true
      t.decimal :price
      t.string :description

      t.timestamps
    end
  end
end
