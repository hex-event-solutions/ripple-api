# frozen_string_literal: true

class WebsiteComponent < ApplicationRecord
  belongs_to :company
  belongs_to :website

  validates :company, :website, :name, :component_type, :template, presence: true
  validates :name, length: { maximum: 32 }, uniqueness: { scope: :company_id }
end
