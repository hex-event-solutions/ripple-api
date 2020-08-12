# frozen_string_literal: true

module Types
  module Ripple
    class DocumentAttachmentType < Types::BaseObject
      field :service_url, String, null: false
    end
  end
end
