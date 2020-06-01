class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.references :client, null: false, foreign_key: true
      t.string :name
      t.string :email
      t.string :phone
      t.text :details

      t.timestamps
    end
  end
end
