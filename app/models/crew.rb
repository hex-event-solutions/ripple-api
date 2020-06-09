# frozen_string_literal: true

class Crew < ApplicationRecord
  has_many :shifts

  belongs_to :company

  has_secure_password

  validates :company, :name, :email, :rate, :price, presence: true
  validates :name, length: { maximum: 128 }, uniqueness: { scope: :company_id }
  validates :email, length: { maximum: 255 }, uniqueness: { scope: :company_id }
  validates :rate, :price, numericality: true
end
