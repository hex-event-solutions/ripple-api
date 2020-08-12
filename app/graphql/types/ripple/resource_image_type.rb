# frozen_string_literal: true

module Types
  module Ripple
    class ResourceImageType < Types::BaseObject
      field :image, Types::Ripple::ImageType, null: false
      field :resource, Types::Ripple::ResourceType, null: false
    end
  end
end
