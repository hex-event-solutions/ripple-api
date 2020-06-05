# frozen_string_literal: true

class CreateAssetEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :asset_events, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.references :company, type: :uuid, null: false, foreign_key: true
      t.references :asset, type: :uuid, null: false, foreign_key: true
      t.references :event, type: :uuid, null: false, foreign_key: true

      t.timestamps
    end
  end
end
