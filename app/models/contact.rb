# frozen_string_literal: true

class Contact < ApplicationRecord
  belongs_to :client

  validates :client, :name, presence: true
  validates :name, length: { maximum: 64 }
  validates :email, length: { maximum: 255 }
  validates :phone, length: { maximum: 16 }
end
