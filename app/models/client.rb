# frozen_string_literal: true

class Client < ApplicationRecord
  has_many :contacts
  has_many :events

  belongs_to :company
  belongs_to :client_type

  validates :organisation_name, presence: true, length: { maximum: 128 }, uniqueness: { scope: :company_id }
  validates :address1, :address2, :address3, :city, :county, length: { maximum: 64 }
  validates :postcode, length: { maximum: 10 }
  validates :discount, presence: true, numericality: { only_integer: true }
  validates :company, :client_type, presence: true
end
