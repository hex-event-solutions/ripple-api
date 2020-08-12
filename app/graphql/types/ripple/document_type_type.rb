# frozen_string_literal: true

module Types
  module Ripple
    class DocumentTypeType < Types::BaseObject
      field :name, String, null: false
      field :styles, String, null: true
      field :header, String, null: true
      field :footer, String, null: true
      field :content, String, null: false
      field :subject, Types::Ripple::DocumentTypeSubject, null: false
      field :increment_pattern, String, null: true
      field :increment_start, Integer, null: true
      field :incremental, Types::BaseObject::Boolean, null: false
      field :date_issued, Types::BaseObject::Boolean, null: false
      field :date_due, Types::BaseObject::Boolean, null: false

      field :documents, [Types::Ripple::DocumentTypeType], null: true
    end
  end
end
