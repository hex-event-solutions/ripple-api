# frozen_string_literal: true

class CrewRole < ApplicationRecord
  belongs_to :company
  belongs_to :crew
  belongs_to :role

  validates :company, :crew, :role, presence: true
end
