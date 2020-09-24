# frozen_string_literal: true

class RowItem < ApplicationRecord
  include EventItems

  # has_many :documents, through: :document_items
  # has_many :events, through: :event_items

  belongs_to :company

  validates :company, :price, :description, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :description, length: { maximum: 255 }

  def formatted_hash(event_item)
    item = attributes.symbolize_keys
    item[:mustache_description] = description
    item[:quantity] = event_item.quantity
    item[:unit_price] = currency(price)
    item
  end

  def duration_price(**_params)
    price
  end
end
