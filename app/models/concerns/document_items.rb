# frozen_string_literal: true

module DocumentItems
  extend ActiveSupport::Concern

  included do
    has_many :documents, as: :item
  end
end
