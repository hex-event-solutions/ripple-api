# frozen_string_literal: true

class RowItem < ApplicationRecord
  include Item

  has_many :documents, through: :document_items

  belongs_to :company

  validates :company, :price, :description, presence: true
  validates :price, numericality: true
  validates :description, length: { maximum: 255 }
end
