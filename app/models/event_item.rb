# frozen_string_literal: true

class EventItem < ApplicationRecord
  template_values quantity: 1, discount: 0

  belongs_to :company
  belongs_to :event
  belongs_to :item, polymorphic: true

  validates :company, :event, :item, presence: true
  validates :quantity, :discount, numericality: true, allow_nil: true

  default_scope { includes(:item) }

  before_save :set_defaults

  def set_defaults
    self.discount ||= 0
    self.quantity ||= 1
  end
end
