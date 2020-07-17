# frozen_string_literal: true

class CreateResourceImages < ActiveRecord::Migration[6.0]
  def change
    create_table :resource_images, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.references :company, type: :uuid, null: false, foreign_key: true
      t.references :image, type: :uuid, null: false
      t.references :resource, type: :uuid, null: false, polymorphic: true, index: true

      t.timestamps
    end
  end
end
