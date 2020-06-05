# frozen_string_literal: true

class Crew < ApplicationRecord
  has_many :crew_roles
  has_many :roles, through: :crew_roles
  has_many :shifts

  has_secure_password

  validates :name, :email, :rate, :price, presence: true
  validates :name, length: { maximum: 128 }, uniqueness: true
  validates :email, length: { maximum: 255 }, uniqueness: true
  validates :rate, :price, numericality: true
end
