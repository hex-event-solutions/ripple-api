class Asset < ApplicationRecord
  belongs_to :asset_type
  belongs_to :case

  has_many :asset_events
  has_many :events, through: :asset_events

  has_many :maintenance_events
end
