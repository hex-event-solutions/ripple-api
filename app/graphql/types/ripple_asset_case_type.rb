# frozen_string_literal: true

module Types
  class RippleAssetCaseType < Types::BaseObject
    field :barcode, String, null: false

    field :assets, [Types::RippleAssetType], null: true
  end
end
