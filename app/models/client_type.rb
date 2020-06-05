# frozen_string_literal: true

class ClientType < ApplicationRecord
  has_many :clients

  belongs_to :company

  validates :company, :name, presence: true
  validates :name, length: { maximum: 32 }, uniqueness: true
end
