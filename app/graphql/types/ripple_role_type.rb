# frozen_string_literal: true

module Types
  class RippleRoleType < Types::BaseObject
    field :name, String, null: false

    field :crew_roles, [Types::RippleCrewRoleType], null: true
    field :crews, [Types::RippleCrewType], null: true
    field :role_privileges, [Types::RippleRolePrivilegeType], null: true
  end
end
