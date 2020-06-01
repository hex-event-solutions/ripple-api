class Asset < ApplicationRecord
  belongs_to :asset_type
  belongs_to :case
end
