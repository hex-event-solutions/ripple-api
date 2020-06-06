# frozen_string_literal: true

module Types
  class CrewType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :email, String, null: false
    field :rate, Float, null: false
    field :price, Float, null: false

    field :crew_roles, [Types::CrewRoleType], null: true
    field :roles, [Types::RoleType], null: true
    field :shifts, [Types::ShiftType], null: true
  end
end
