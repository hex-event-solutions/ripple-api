# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :asset_type_categories
  has_many :asset_types, through: :asset_type_categories

  has_many :children, class_name: 'Category', foreign_key: :parent_id
  belongs_to :parent, class_name: 'Category', optional: true

  before_validation :generate_fullname

  validates :name, presence: true, length: { maximum: 32 }
  validates :fullname, uniqueness: true

  # private

  def generate_fullname
    self.fullname = if parent
                      "#{parent.fullname} - #{name}"
                    else
                      name
                    end
  end
end
