# frozen_string_literal: true

module Types
  module Ripple
    class AssetCaseType < Types::BaseObject
      field :barcode, String, null: false

      field :assets, [Types::Ripple::AssetType], null: true
      field :documents, [Types::Ripple::DocumentType], null: true
    end
  end
end
