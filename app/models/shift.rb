# frozen_string_literal: true

class Shift < ApplicationRecord
  belongs_to :crew
  belongs_to :event
end
