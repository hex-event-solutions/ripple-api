# frozen_string_literal: true

module Types
  class RippleClientType < Types::BaseObject
    field :organisation_name, String, null: false
    field :address1, String, null: false
    field :address2, String, null: true
    field :address3, String, null: true
    field :city, String, null: false
    field :county, String, null: false
    field :postcode, String, null: false
    field :discount, Int, null: false

    field :contacts, [Types::RippleContactType], null: true
    field :events, [Types::RippleEventType], null: true
    field :documents, [Types::RippleDocumentType], null: true

    field :client_type, Types::RippleClientTypeType, null: false
  end
end
