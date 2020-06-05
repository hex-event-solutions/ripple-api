# frozen_string_literal: true

class AssetCase < ApplicationRecord
  has_many :assets

  validates :barcode, presence: true, length: { maximum: 16 }
end
