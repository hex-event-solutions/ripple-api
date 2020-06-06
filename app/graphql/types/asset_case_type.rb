# frozen_string_literal: true

module Types
  class AssetCaseType < Types::BaseObject
    field :id, ID, null: false
    field :barcode, String, null: false

    field :assets, [Types::AssetType], null: true
  end
end
