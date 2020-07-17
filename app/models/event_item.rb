# frozen_string_literal: true

class EventItem < ApplicationRecord
  belongs_to :company
  belongs_to :event
  belongs_to :item, polymorphic: true

  validates :company, :event, :item, presence: true
  validates :quantity, :discount, numericality: true, allow_nil: true

  default_scope { includes(:item) }
end
