# frozen_string_literal: true

class Document < ApplicationRecord
  has_many :document_items
  has_many :items, through: :document_items

  belongs_to :company
  belongs_to :client
  belongs_to :event, optional: true
  belongs_to :document_type

  validates :company, :client, :document_type, presence: true
end
