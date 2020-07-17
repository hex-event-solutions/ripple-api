# frozen_string_literal: true

class RowItem < ApplicationRecord
  include DocumentItems
  include EventItems

  # has_many :documents, through: :document_items
  # has_many :events, through: :event_items

  belongs_to :company

  validates :company, :price, :description, presence: true
  validates :price, numericality: true
  validates :description, length: { maximum: 255 }
end
