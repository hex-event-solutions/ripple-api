# frozen_string_literal: true

module Mutations
  module AssetTypeCategories
    class Delete < AuthorizedMutation
      include Helpers::Delete

      argument :id, ID, required: true

      field :id, ID, null: true

      def resolve(id:)
        delete(AssetTypeCategory, id)
      end
    end
  end
end
