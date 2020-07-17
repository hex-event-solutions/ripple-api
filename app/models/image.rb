# frozen_string_literal: true

class Image < ApplicationRecord
  has_many :resource_images

  has_many :categories, through: :resource_images, source_type: 'Category'
  has_many :asset_types, through: :resource_images, source_type: 'AssetType'

  belongs_to :company

  def url
    "#{ENV.fetch('CDN_BASE_URL')}/ripple/#{company_id}/#{id}"
  end
end
