# frozen_string_literal: true

class DocumentType < ApplicationRecord
  has_many :documents

  belongs_to :company

  validates :company, :name, :template, :subject, presence: true
  validates :name, length: { maximum: 32 }, uniqueness: { scope: :company_id }

  def full_template
    %(
      <html>
        <head>
          <meta charset="utf-8">
          <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
          <style>#{styles}</style>
        </head>
        <body>{{#subject}}#{template}{{/subject}}</body>
      </html>
    )
  end
end
