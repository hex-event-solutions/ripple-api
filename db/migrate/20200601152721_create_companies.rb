# frozen_string_literal: true

class CreateCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :vat_number
      t.string :company_number
      t.string :address1
      t.string :address2
      t.string :address3
      t.string :city
      t.string :county
      t.string :postcode
      t.string :phone_number
      t.string :logo

      t.timestamps
    end
  end
end
