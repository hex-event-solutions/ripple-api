# frozen_string_literal: true

class Document < ApplicationRecord
  has_many :document_items, dependent: :destroy
  has_many :asset_types, through: :document_items, source_type: 'AssetType'
  has_many :row_items, through: :document_items, source_type: 'RowItem'

  has_many_attached :files

  belongs_to :company
  belongs_to :document_type

  validates :company, :document_type, presence: true

  default_scope { includes(:document_type) }

  def generate
    if subject_id
      subject_class = document_type.subject.constantize
      subject = subject_class.find(subject_id)
    end

    output = Mustache.render(document_type.full_template, document: self, subject: subject)

    WickedPdf.new.pdf_from_string(output.html_safe)
  end

  def display_date_issued
    date_issued.strftime('%d-%m-%Y')
  end

  def display_date_due
    date_due.strftime('%d-%m-%Y')
  end
end
