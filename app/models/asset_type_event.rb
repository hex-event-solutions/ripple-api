class AssetTypeEvent < ApplicationRecord
  belongs_to :asset_type
  belongs_to :event
end
