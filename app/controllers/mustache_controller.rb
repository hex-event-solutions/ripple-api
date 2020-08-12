# frozen_string_literal: true

require 'mustache'

class MustacheController < ApplicationController
  def document
    @document ||= Document.find_by(document_type: DocumentType.find_by(name: 'Pick List'))
  end

  def test
    pdf = document.generate
    send_data pdf, filename: "#{document.document_type.name}-#{document.number}", type: 'application/pdf'
  end
end
