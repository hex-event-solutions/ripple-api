class CreateCases < ActiveRecord::Migration[6.0]
  def change
    create_table :cases do |t|
      t.string :barcode

      t.timestamps
    end
  end
end
