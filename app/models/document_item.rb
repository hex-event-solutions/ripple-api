# frozen_string_literal: true

class DocumentItem < ApplicationRecord
  belongs_to :document
  belongs_to :item
  belongs_to :item_type

  validates :document, :item, :item_type, :quantity, :discount, presence: true
  validates :quantity, :discount, numericality: true
end
