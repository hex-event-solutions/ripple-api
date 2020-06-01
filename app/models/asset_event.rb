class AssetEvent < ApplicationRecord
  belongs_to :asset
  belongs_to :event
end
