# frozen_string_literal: true

class CreateCompanySettings < ActiveRecord::Migration[6.0]
  def change
    create_table :company_settings, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.references :company, type: :uuid, null: false, foreign_key: true
      t.references :setting, type: :uuid, null: false, foreign_key: true
      t.string :value

      t.timestamps
    end
  end
end
