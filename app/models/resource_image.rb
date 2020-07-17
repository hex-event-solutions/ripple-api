# frozen_string_literal: true

class ResourceImage < ApplicationRecord
  belongs_to :resource, polymorphic: true
  belongs_to :image

  belongs_to :company
end
