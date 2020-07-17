# frozen_string_literal: true

module Types
  class RippleCategoryType < Types::BaseObject
    field :name, String, null: false
    field :fullname, String, null: false

    field :children, [Types::RippleCategoryType], null: true
    field :images, [Types::RippleImageType], null: true

    field :parent, Types::RippleCategoryType, null: true
  end
end
