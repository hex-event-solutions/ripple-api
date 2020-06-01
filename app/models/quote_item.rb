# frozen_string_literal: true

class QuoteItem < ApplicationRecord
  belongs_to :quote
  belongs_to :item
end
