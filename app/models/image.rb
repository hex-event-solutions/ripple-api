# frozen_string_literal: true

class Image < ApplicationRecord
  has_many :resource_images, dependent: :destroy

  has_many :categories, through: :resource_images, source_type: 'Category'
  has_many :asset_types, through: :resource_images, source_type: 'AssetType'

  belongs_to :company

  has_one_attached :file

  def url
    file.service_url
  end

  def small
    file.variant(resize_and_pad: [64, 64], convert: 'png').processed.service_url
  end

  def medium
    file.variant(resize_and_pad: [256, 256], convert: 'png').processed.service_url
  end

  def large
    file.variant(resize_and_pad: [512, 512], convert: 'png').processed.service_url
  end
end
