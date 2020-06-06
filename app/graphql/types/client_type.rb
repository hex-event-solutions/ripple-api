# frozen_string_literal: true

module Types
  class ClientType < Types::BaseObject
    field :id, ID, null: false
    field :organisation_name, String, null: false
    field :address1, String, null: false
    field :address2, String, null: true
    field :address3, String, null: true
    field :city, String, null: false
    field :county, String, null: false
    field :postcode, String, null: false
    field :discount, Int, null: false

    field :contacts, [Types::ContactType], null: true
    field :events, [Types::EventType], null: true
    field :documents, [Types::DocumentType], null: true

    field :client_type, Types::ClientTypeType, null: false
  end
end
