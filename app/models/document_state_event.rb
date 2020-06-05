# frozen_string_literal: true

class DocumentStateEvent < ApplicationRecord
  belongs_to :document
  belongs_to :document_state

  validates :document_state, :document, presence: true
end
