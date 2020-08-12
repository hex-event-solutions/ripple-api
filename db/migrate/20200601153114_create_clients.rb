# frozen_string_literal: true

class CreateClients < ActiveRecord::Migration[6.0]
  def change
    create_table :clients, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.references :company, type: :uuid, null: false, foreign_key: true
      t.references :client_type, type: :uuid, null: false, foreign_key: true
      t.string :organisation_name
      t.string :address1
      t.string :address2
      t.string :address3
      t.string :city
      t.string :county
      t.string :postcode
      t.integer :discount
      t.boolean :template, null: false, default: false

      t.timestamps
    end
  end
end
