# frozen_string_literal: true

module Mutations
  class AuthorizedMutation < Mutations::BaseMutation
    class << self
      attr_accessor :action_type, :resource_type

      def action(action_type)
        @action_type = action_type.to_s
      end

      def resource(resource_type)
        @resource_type = resource_type.to_s
      end

      def inherited(subclass)
        _, module_class, self_class = subclass.name.split('::')
        name = "#{self_class}#{module_class}".to_sym
        subclass.graphql_name name
        puts "Resource: #{module_class.underscore}, action: #{self_class.underscore}"
        subclass.resource module_class.singularize.underscore
        subclass.action self_class.underscore
      end
    end

    def required_role
      "#{self.class.resource_type}##{self.class.action_type}"
    end

    def ready?(**_args)
      unauthorized_msg = 'You are not authorized to perform this action'
      raise GraphQL::ExecutionError, unauthorized_msg unless context[:user_roles].include? required_role

      true
    end

    def validate_same_company(object)
      msg = "#{object.class.name.underscore.humanize} not found"

      raise GraphQL::ExecutionError, msg if object.company_id != context[:company_id]
    end

    def invalid_foreign_key(err)
      table = err.message.match(/on table "([a-z_]+)"\n/)&.captures&.first

      not_found_msg = 'This object is still referenced, but the referenced table could not be identified'
      raise GraphQL::ExecutionError, not_found_msg if table.nil?

      ref_msg = "This object is still referenced by at least one #{table.humanize.singularize.titleize}"
      raise GraphQL::ExecutionError, ref_msg
    end
  end
end
