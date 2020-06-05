# frozen_string_literal: true

class Asset < ApplicationRecord
  has_many :asset_events
  has_many :events, through: :asset_events
  has_many :maintenance_events

  belongs_to :company
  belongs_to :asset_type
  belongs_to :asset_case

  validates :company, :asset_type, :asset_case, :barcode, presence: true
  validates :barcode, length: { maximum: 16 }
end
