class CreateAssetEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :asset_events do |t|
      t.references :asset, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
