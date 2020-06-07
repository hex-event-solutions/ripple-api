# frozen_string_literal: true

module Types
  class RippleDocumentTypeFieldType < Types::BaseObject
    field :name, String, null: false
    field :resource, String, null: false
    field :property, String, null: false

    field :document_type, Types::RippleDocumentTypeType, null: false
  end
end
