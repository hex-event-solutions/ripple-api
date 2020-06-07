# frozen_string_literal: true

module Types
  class RippleClientTypeType < Types::BaseObject
    field :name, String, null: false

    field :clients, [Types::RippleClientType], null: true
  end
end
