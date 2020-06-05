# frozen_string_literal: true

class AssetCase < ApplicationRecord
  has_many :assets

  belongs_to :company

  validates :company, :barcode, presence: true
  validates :barcode, length: { maximum: 16 }
end
