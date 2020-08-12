# frozen_string_literal: true

module Types
  module Ripple
    class CategoryType < Types::BaseObject
      field :name, String, null: false
      field :fullname, String, null: false

      field :children, [Types::Ripple::CategoryType], null: true
      field :images, [Types::Ripple::ImageType], null: true
      field :asset_types, [Types::Ripple::AssetTypeType], null: true
      field :documents, [Types::Ripple::DocumentType], null: true

      field :parent, Types::Ripple::CategoryType, null: true
    end
  end
end
