# frozen_string_literal: true

class CreateSettings < ActiveRecord::Migration[6.0]
  def change
    create_table :settings, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.string :name
      t.boolean :template, null: false, default: false

      t.timestamps
    end
  end
end
