# frozen_string_literal: true

module Types
  class RippleResourceImageType < Types::BaseObject
    field :image, Types::RippleImageType, null: false
    field :resource, Types::RippleResourceType, null: false
  end
end
