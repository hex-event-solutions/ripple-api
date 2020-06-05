# frozen_string_literal: true

class DocumentTypeField < ApplicationRecord
  belongs_to :company
  belongs_to :document_type

  validates :company, :name, :object, :property, :document_type, presence: true
  validates :name, length: { maximum: 32 }
end
