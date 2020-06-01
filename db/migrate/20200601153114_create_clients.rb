class CreateClients < ActiveRecord::Migration[6.0]
  def change
    create_table :clients do |t|
      t.string :organisation_name
      t.string :address1
      t.string :address2
      t.string :address3
      t.string :city
      t.string :county
      t.string :postcode
      t.references :client_type, null: false, foreign_key: true
      t.integer :discount

      t.timestamps
    end
  end
end
