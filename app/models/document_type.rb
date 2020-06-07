# frozen_string_literal: true

class DocumentType < ApplicationRecord
  has_many :documents
  has_many :document_type_fields

  belongs_to :company

  validates :company, :name, presence: true
  validates :name, length: { maximum: 32 }, uniqueness: { scope: :company }
end
