# frozen_string_literal: true

class Role < ApplicationRecord
  has_many :crew_roles
  has_many :crew, through: :crew_roles
  has_many :role_privileges

  validates :name, presence: true, length: { maximum: 32 }, uniqueness: true
end
