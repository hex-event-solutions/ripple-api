# frozen_string_literal: true

module Mutations
  module AssetTypeMultiplierTypes
    class Delete < AuthorizedMutation
      include Helpers::Delete

      argument :id, ID, required: true

      field :id, ID, null: true

      def resolve(id:)
        delete(AssetTypeMultiplierType, id)
      end
    end
  end
end
