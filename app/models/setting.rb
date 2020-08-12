# frozen_string_literal: true

class Setting < ApplicationRecord
  has_many :company_settings

  validates :name, presence: true

  def self.for(company_id:, name:)
    find_by!(name: name).company_settings.find_by(company_id: company_id)&.value
  end
end
