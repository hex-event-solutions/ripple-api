# frozen_string_literal: true

class Category < ApplicationRecord
  include Documents
  include Resource

  template_values name: 'Template root category'

  has_many :asset_type_categories, dependent: :destroy
  has_many :asset_types, through: :asset_type_categories

  has_many :children, class_name: 'Category', foreign_key: :parent_id, dependent: :destroy
  belongs_to :parent, class_name: 'Category', optional: true

  belongs_to :company

  before_validation :generate_fullname

  validates :company, :name, presence: true
  validates :name, length: { maximum: 32 }
  validates :fullname, uniqueness: { scope: :company_id }

  # private

  def generate_fullname
    self.fullname = if parent
                      "#{parent.fullname} - #{name}"
                    else
                      name
                    end
  end
end
