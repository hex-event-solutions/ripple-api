# frozen_string_literal: true

class Crew < ApplicationRecord
  has_many :crew_roles
  has_many :roles, through: :crew_roles
end
