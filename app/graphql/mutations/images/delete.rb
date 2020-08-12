# frozen_string_literal: true

module Mutations
  module Images
    class Delete < AuthorizedMutation
      include Helpers::Delete

      argument :id, ID, required: true

      field :id, ID, null: true

      def resolve(id:)
        delete(ResourceImage, id)
      end
    end
  end
end
