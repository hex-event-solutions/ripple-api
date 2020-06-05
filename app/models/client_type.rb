# frozen_string_literal: true

class ClientType < ApplicationRecord
  has_many :clients

  validates :name, presence: true, length: { maximum: 32 }, uniqueness: true
end
