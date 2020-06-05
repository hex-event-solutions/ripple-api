# frozen_string_literal: true

class DocumentTypeField < ApplicationRecord
  belongs_to :document_type

  validates :name, :object, :property, :document_type, presence: true
  validates :name, length: { maximum: 32 }
end
