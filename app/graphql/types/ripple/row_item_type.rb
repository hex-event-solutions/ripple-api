# frozen_string_literal: true

module Types
  module Ripple
    class RowItemType < Types::BaseObject
      field :price, Float, null: false
      field :description, String, null: false
    end
  end
end
