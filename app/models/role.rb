# frozen_string_literal: true

class Role < ApplicationRecord
  has_many :crew_roles
  has_many :crew, through: :crew_roles
  has_many :role_privileges

  belongs_to :company

  validates :company, :name, presence: true
  validates :name, length: { maximum: 32 }, uniqueness: true
end
