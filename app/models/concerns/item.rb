# frozen_string_literal: true

module Item
  extend ActiveSupport::Concern

  included do
    has_many :document_items, as: :item
  end
end
