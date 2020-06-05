# frozen_string_literal: true

class Shift < ApplicationRecord
  belongs_to :crew
  belongs_to :event

  validates :crew, :event, :start, :finish, :rate, :price, presence: true
  validates :rate, :price, numericality: true
end
