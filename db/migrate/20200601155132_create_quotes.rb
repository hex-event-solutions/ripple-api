class CreateQuotes < ActiveRecord::Migration[6.0]
  def change
    create_table :quotes do |t|
      t.integer :event_id
      t.references :client, null: false, foreign_key: true
      t.datetime :date_sent
      t.datetime :date_expires
      t.integer :state

      t.timestamps
    end
  end
end