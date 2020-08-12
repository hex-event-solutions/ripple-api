# frozen_string_literal: true

module Types
  module Ripple
    class BlobType < Types::BaseObject
      field :serviceUrl, String, null: false
      field :headers, [String], null: true
    end
  end
end
