# frozen_string_literal: true

module Types
  module Ripple
    class ContactType < Types::BaseObject
      field :name, String, null: false
      field :email, String, null: true
      field :phone, String, null: true
      field :details, String, null: true

      field :client, Types::Ripple::ClientType, null: false
    end
  end
end
