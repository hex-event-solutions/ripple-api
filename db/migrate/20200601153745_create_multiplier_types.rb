# frozen_string_literal: true

class CreateMultiplierTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :multiplier_types, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.references :company, type: :uuid, null: false, foreign_key: true
      t.string :name
      t.integer :multiplier
      t.string :multiplier_type
      t.integer :operand_quantity
      t.string :operand_type
      t.boolean :template, null: false, default: false

      t.timestamps
    end
  end
end
