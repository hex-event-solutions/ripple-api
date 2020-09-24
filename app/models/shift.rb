# frozen_string_literal: true

class Shift < ApplicationRecord
  include Documents

  template_values(
    crew_id: 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa',
    rate: 18,
    price: 24
  )

  belongs_to :company
  belongs_to :event

  validates :company, :event, :start, :finish, :rate, :price, :crew_id, presence: true
  validates :rate, :price, numericality: { greater_than_or_equal_to: 0 }

  def crew
    # Crew.fetch('', id: crew_id)
  end
end
