# frozen_string_literal: true

module Mutations
  module Helpers
    module Delete
      def delete(class_type, id)
        obj = class_type.find(id)

        validate_same_company obj

        begin
          return { id: id } if obj.destroy
        rescue ActiveRecord::InvalidForeignKey => e
          invalid_foreign_key e
        end

        raise GraphQL::ExecutionError, obj.errors.full_messages.join(', ')
      end
    end
  end
end
