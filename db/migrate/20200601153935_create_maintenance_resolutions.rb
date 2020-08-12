# frozen_string_literal: true

class CreateMaintenanceResolutions < ActiveRecord::Migration[6.0]
  def change
    create_table :maintenance_resolutions, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.references :company, type: :uuid, null: false, foreign_key: true
      t.string :name
      t.boolean :template, null: false, default: false

      t.timestamps
    end
  end
end
