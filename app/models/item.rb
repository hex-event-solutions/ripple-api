# frozen_string_literal: true

class Item < ApplicationRecord
  has_many :document_items
  has_many :documents, through: :document_items

  validates :price, :description, presence: true
  validates :price, numericality: true
  validates :description, length: { maximum: 255 }
end
