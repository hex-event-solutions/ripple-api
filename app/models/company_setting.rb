# frozen_string_literal: true

class CompanySetting < ApplicationRecord
  belongs_to :company
  belongs_to :setting

  def plural
    value.pluralize
  end
end
