# frozen_string_literal: true

module Mutations
  module Helpers
    module Create
      def create(class_type, company_id, params)
        obj = class_type.new(company_id: company_id, **params)

        return { class_type.name.underscore.to_sym => obj } if obj.save

        raise GraphQL::ExecutionError, obj.errors.full_messages.join(', ')
      end
    end
  end
end
