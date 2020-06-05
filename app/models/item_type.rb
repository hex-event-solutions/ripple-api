# frozen_string_literal: true

class ItemType < ApplicationRecord
  has_many :document_items

  validates :name, presence: true, length: { maximum: 32 }, uniqueness: true
end
