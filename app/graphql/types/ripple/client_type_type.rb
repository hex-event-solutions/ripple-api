# frozen_string_literal: true

module Types
  module Ripple
    class ClientTypeType < Types::BaseObject
      field :name, String, null: false

      field :clients, [Types::Ripple::ClientType], null: true
    end
  end
end
