# frozen_string_literal: true

module Types
  class RippleImageType < Types::BaseObject
    field :url, String, null: false
    field :alt, String, null: true
  end
end
