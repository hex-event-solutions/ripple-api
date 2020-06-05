# frozen_string_literal: true

class DocumentState < ApplicationRecord
  has_many :document_state_events

  validates :name, presence: true, length: { maximum: 32 }, uniqueness: true
end
