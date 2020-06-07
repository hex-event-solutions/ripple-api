# frozen_string_literal: true

module Types
  class RippleContactType < Types::BaseObject
    field :name, String, null: false
    field :email, String, null: true
    field :phone, String, null: true
    field :details, String, null: true

    field :client, Types::RippleClientType, null: false
  end
end
