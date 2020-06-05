# frozen_string_literal: true

class DocumentType < ApplicationRecord
  has_many :documents
  has_many :document_type_fields

  validates :name, presence: true, length: { maximum: 32 }, uniqueness: true
end
