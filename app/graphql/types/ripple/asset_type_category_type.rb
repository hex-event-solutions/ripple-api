# frozen_string_literal: true

module Types
  module Ripple
    class AssetTypeCategoryType < Types::BaseObject
      field :asset_type, Types::Ripple::AssetTypeType, null: false
      field :category, Types::Ripple::CategoryType, null: false
    end
  end
end
