# frozen_string_literal: true

module EventItems
  extend ActiveSupport::Concern

  included do
    has_many :events, as: :item
  end
end
