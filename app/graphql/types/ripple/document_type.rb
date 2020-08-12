# frozen_string_literal: true

module Types
  module Ripple
    class DocumentType < Types::BaseObject
      field :subject_id, String, null: true
      field :subject, Types::Ripple::DocumentSubject, null: true
      field :document_type, Types::Ripple::DocumentTypeType, null: false
      field :reference, String, null: true
      field :date_issued, GraphQL::Types::ISO8601DateTime, null: true
      field :date_due, GraphQL::Types::ISO8601DateTime, null: true
      field :url, String, null: true
    end
  end
end
