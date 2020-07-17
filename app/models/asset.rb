# frozen_string_literal: true

class Asset < ApplicationRecord
  include EventItems

  has_many :maintenance_events

  belongs_to :company
  belongs_to :asset_type
  belongs_to :asset_case, optional: true

  validates :company, :asset_type, :barcode, presence: true
  validates :barcode, length: { maximum: 16 }
end
