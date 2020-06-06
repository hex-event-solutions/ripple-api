# frozen_string_literal: true

class DocumentItem < ApplicationRecord
  belongs_to :company
  belongs_to :document
  belongs_to :item, polymorphic: true

  validates :company, :document, :item, :quantity, :discount, presence: true
  validates :quantity, :discount, numericality: true
end
