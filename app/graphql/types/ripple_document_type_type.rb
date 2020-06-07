# frozen_string_literal: true

module Types
  class RippleDocumentTypeType < Types::BaseObject
    field :name, String, null: false

    field :documents, [Types::RippleDocumentTypeType], null: true
    field :document_type_fields, [Types::RippleDocumentTypeFieldType], null: true
  end
end
