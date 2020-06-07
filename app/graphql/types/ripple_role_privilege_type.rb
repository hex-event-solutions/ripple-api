# frozen_string_literal: true

module Types
  class RippleRolePrivilegeType < Types::BaseObject
    field :action, String, null: false
    field :resource, String, null: false

    field :role, Types::RippleRoleType, null: false
  end
end
