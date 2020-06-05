# frozen_string_literal: true

class AssetEvent < ApplicationRecord
  belongs_to :company
  belongs_to :asset
  belongs_to :event

  validates :company, :asset, :event, presence: true
end
