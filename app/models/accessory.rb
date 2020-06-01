class Accessory < ApplicationRecord
  belongs_to :asset_type
  belongs_to :accessory, class_name: 'AssetType', foreign_key: :accessory_asset_type_id
end
