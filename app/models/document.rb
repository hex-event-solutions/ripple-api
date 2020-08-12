# frozen_string_literal: true

class Document < ApplicationRecord
  has_many_attached :files

  has_many :document_state_events, dependent: :destroy

  belongs_to :company
  belongs_to :document_type

  validates :company, :document_type, presence: true

  default_scope { includes(:document_type, :files_attachments) }

  def generate
    header = Mustache.render(document_type.header_template, subject: subject)
    content = Mustache.render(document_type.full_template, document: self, subject: subject)

    pp document_type.full_template

    footer = Mustache.render(document_type.footer_template, subject: subject)

    pdf = WickedPdf.new.pdf_from_string(
      content.html_safe,
      margin: { top: 29, left: 0, right: 0, bottom: 25 },
      header: {
        content: header.html_safe
      },
      footer: {
        content: footer.html_safe
      }
    )
    file = Tempfile.new
    file.binmode
    file.write(pdf)
    file.rewind
    files.attach(io: file, filename: "#{document_type.name}-#{reference}.pdf", content_type: 'application/pdf')
    file.close
    file.unlink
    files.last
  end

  def display_date_issued
    date_issued.strftime('%d-%m-%Y')
  end

  def display_date_due
    date_due.strftime('%d-%m-%Y')
  end

  def subject
    return unless subject_id

    subject_class = document_type.subject.constantize
    @subject ||= subject_class.find(subject_id)
  end

  def url
    files.last.service_url if files.attached?
  end
end
