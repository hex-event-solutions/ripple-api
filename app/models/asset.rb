# frozen_string_literal: true

class Asset < ApplicationRecord
  include Documents
  include EventItems

  template_values barcode: 'Template barcode'

  has_many :maintenance_events, dependent: :destroy

  belongs_to :company
  belongs_to :asset_type
  belongs_to :asset_case, optional: true

  validates :company, :asset_type, :barcode, presence: true
  validates :barcode, length: { maximum: 16 }, uniqueness: { scope: :company_id }

  before_validation :create_barcode, on: :create

  mustache(
    barcode: ->(v) { v },
    case: ->(v) { v }
  )

  def case
    asset_case
  end

  def create_barcode
    current_barcode = self.class.where(company_id: company_id).without_templates.maximum(:barcode_number) || 0
    next_barcode = current_barcode + 1
    self.barcode_number = next_barcode
    self.barcode ||= format_barcode(number: next_barcode)
  end

  private

  def format_barcode(number:)
    pattern = Setting.for(company_id: company_id, name: 'Asset barcode pattern')
    pre, placeholder, post = pattern.match(/^(.*)\((0*)\)(.*)$/).captures
    formatter = "%0#{placeholder&.length || 0}d"
    format("#{pre}#{formatter}#{post}", number)
  end
end
