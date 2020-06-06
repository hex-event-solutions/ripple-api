# frozen_string_literal: true

module Types
  class CrewRoleType < Types::BaseObject
    field :id, ID, null: false

    field :crew, Types::CrewType, null: false
    field :role, Types::RoleType, null: false
  end
end
