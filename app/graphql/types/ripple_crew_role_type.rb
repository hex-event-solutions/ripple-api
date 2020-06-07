# frozen_string_literal: true

module Types
  class RippleCrewRoleType < Types::BaseObject
    field :crew, Types::RippleCrewType, null: false
    field :role, Types::RippleRoleType, null: false
  end
end
