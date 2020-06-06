# frozen_string_literal: true

module Types
  class AssetTypeCategoryType < Types::BaseObject
    field :id, ID, null: false

    field :asset_type, Types::AssetTypeType, null: false
    field :category, Types::Category, null: false
  end
end
