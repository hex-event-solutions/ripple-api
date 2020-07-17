# frozen_string_literal: true

module Mutations
  module ClientTypes
    class Delete < AuthorizedMutation
      include Helpers::Delete

      argument :id, ID, required: true

      field :id, ID, null: true

      def resolve(id:)
        delete(ClientType, id)
      end
    end
  end
end
