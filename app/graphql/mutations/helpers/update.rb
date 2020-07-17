# frozen_string_literal: true

module Mutations
  module Helpers
    module Update
      def update(class_type, id, params)
        obj = class_type.find(id)

        validate_same_company obj

        return { class_type.name.underscore.to_sym => obj } if obj.update(params)

        raise GraphQL::ExecutionError, obj.errors.full_messages.join(', ')
      end
    end
  end
end
