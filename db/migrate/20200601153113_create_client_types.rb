# frozen_string_literal: true

class CreateClientTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :client_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
