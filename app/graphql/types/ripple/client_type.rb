# frozen_string_literal: true

module Types
  module Ripple
    class ClientType < Types::BaseObject
      field :organisation_name, String, null: false
      field :address, String, null: false
      field :address1, String, null: false
      field :address2, String, null: true
      field :address3, String, null: true
      field :city, String, null: false
      field :county, String, null: false
      field :postcode, String, null: false
      field :discount, Int, null: false

      field :contacts, [Types::Ripple::ContactType], null: true
      field :events, [Types::Ripple::EventType], null: true
      field :documents, [Types::Ripple::DocumentType], null: true

      field :client_type, Types::Ripple::ClientTypeType, null: false
    end
  end
end
