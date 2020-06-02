# frozen_string_literal: true

class Role < ApplicationRecord
  has_many :crew_roles
  has_many :crew, through: :crew_roles
end
