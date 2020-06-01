# frozen_string_literal: true

class CreateMaintenanceResolutions < ActiveRecord::Migration[6.0]
  def change
    create_table :maintenance_resolutions do |t|
      t.string :name

      t.timestamps
    end
  end
end
