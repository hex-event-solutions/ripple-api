# frozen_string_literal: true

class AssetCase < ApplicationRecord
  include Documents

  template_values barcode: 'Template barcode'

  has_many :assets

  belongs_to :company

  validates :company, :barcode, presence: true
  validates :barcode, length: { maximum: 16 }
  validates :number, numericality: { greater_than_or_equal_to: 0 }

  before_validation :create_barcode, on: :create

  mustache(
    barcode: ->(v) { v }
  )

  def create_barcode
    current_barcode = self.class.where(company_id: company_id).without_templates.maximum(:barcode_number) || 0
    next_barcode = current_barcode + 1
    self.barcode_number = next_barcode
    self.barcode ||= format_barcode(number: next_barcode)
  end

  private

  def format_barcode(number:)
    pattern = Setting.for(company_id: company_id, name: 'Asset case barcode pattern')
    pre, placeholder, post = pattern.match(/^(.*)\((0*)\)(.*)$/).captures
    formatter = "%0#{placeholder&.length || 0}d"
    format("#{pre}#{formatter}#{post}", number)
  end
end
