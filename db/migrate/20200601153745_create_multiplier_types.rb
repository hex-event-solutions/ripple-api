# frozen_string_literal: true

class CreateMultiplierTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :multiplier_types do |t|
      t.references :company, null: false, foreign_key: true
      t.string :name
      t.decimal :multiplier
      t.string :operand_type
      t.decimal :operand_quantity

      t.timestamps
    end
  end
end
