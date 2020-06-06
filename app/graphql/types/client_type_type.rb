# frozen_string_literal: true

module Types
  class ClientTypeType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false

    field :clients, [Types::ClientType], null: true
  end
end
