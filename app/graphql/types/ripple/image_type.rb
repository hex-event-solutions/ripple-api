# frozen_string_literal: true

module Types
  module Ripple
    class ImageType < Types::BaseObject
      field :url, String, null: false
      field :alt, String, null: true
      field :small, String, null: false
      field :medium, String, null: false
      field :large, String, null: false
    end
  end
end
