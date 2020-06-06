# frozen_string_literal: true

module Types
  class CategoryType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :fullname, String, null: false

    field :children, [Types::CategoryType], null: true

    field :parent, Types::CategoryType, null: true
  end
end
