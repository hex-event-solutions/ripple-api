# frozen_string_literal: true

module EventItems
  extend ActiveSupport::Concern

  included do
    has_many :event_items, as: :item
    has_many :events, through: :event_items
  end
end
