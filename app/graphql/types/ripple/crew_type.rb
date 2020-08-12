# frozen_string_literal: true

module Types
  module Ripple
    class CrewType < Types::BaseObject
      field :name, String, null: false
      field :email, String, null: false
      field :rate, Float, null: false
      field :price, Float, null: false
      field :phone, String, null: true

      field :shifts, [Types::Ripple::ShiftType], null: true
    end
  end
end
