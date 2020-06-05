# frozen_string_literal: true

class DocumentStateEvent < ApplicationRecord
  belongs_to :company
  belongs_to :document
  belongs_to :document_state

  validates :company, :document_state, :document, presence: true
end
