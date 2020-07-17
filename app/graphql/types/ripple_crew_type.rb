# frozen_string_literal: true

module Types
  class RippleCrewType < Types::BaseObject
    field :name, String, null: false
    field :email, String, null: false
    field :rate, Float, null: false
    field :price, Float, null: false

    field :shifts, [Types::RippleShiftType], null: true
  end
end
