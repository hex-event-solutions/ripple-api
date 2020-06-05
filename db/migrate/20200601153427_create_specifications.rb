# frozen_string_literal: true

class CreateSpecifications < ActiveRecord::Migration[6.0]
  def change
    create_table :specifications, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.references :company, type: :uuid, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
