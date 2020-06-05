# frozen_string_literal: true

class ItemType < ApplicationRecord
  has_many :document_items

  belongs_to :company

  validates :company, :name, presence: true
  validates :name, length: { maximum: 32 }, uniqueness: true
end
