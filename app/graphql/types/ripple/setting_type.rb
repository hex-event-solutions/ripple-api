# frozen_string_literal: true

module Types
  module Ripple
    class SettingType < Types::BaseObject
      field :name, String, null: false
      # field :value, String, null: false
      # field :plural, String, null: false
    end
  end
end
