# frozen_string_literal: true

class ResourceImage < ApplicationRecord
  belongs_to :resource, polymorphic: true
  belongs_to :image

  belongs_to :company

  after_create :create_variations

  default_scope { includes(:image) }

  def create_variations
    image.small
    image.medium
    image.large
  end
end
