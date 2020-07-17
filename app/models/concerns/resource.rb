# frozen_string_literal: true

module Resource
  extend ActiveSupport::Concern

  included do
    has_many :resource_images, as: :resource
  end
end
