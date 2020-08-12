# frozen_string_literal: true

class Website < ApplicationRecord
  has_many :website_components

  belongs_to :company

  validates :company, :template, presence: true
end
