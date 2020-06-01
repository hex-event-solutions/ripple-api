# frozen_string_literal: true

class CrewRole < ApplicationRecord
  belongs_to :crew
  belongs_to :role
end
