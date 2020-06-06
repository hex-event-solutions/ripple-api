# frozen_string_literal: true

module Types
  class ContactType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :email, String, null: true
    field :phone, String, null: true
    field :details, String, null: true

    field :client, Types::ClientType, null: false
  end
end
