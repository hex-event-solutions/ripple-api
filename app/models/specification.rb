# frozen_string_literal: true

class Specification < ApplicationRecord
  has_many :asset_type_specifications
  has_many :asset_types, through: :asset_type_specifications

  belongs_to :company

  validates :company, :name, presence: true
  validates :name, length: { maximum: 32 }, uniqueness: { scope: :company_id }
end
