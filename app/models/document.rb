# frozen_string_literal: true

class Document < ApplicationRecord
  has_many :document_items, dependent: :destroy
  has_many :asset_types, through: :document_items, source_type: 'AssetType'
  has_many :row_items, through: :document_items, source_type: 'RowItem'

  belongs_to :company
  belongs_to :event, optional: true
  belongs_to :client
  belongs_to :document_type

  validates :company, :client, :document_type, presence: true
end
