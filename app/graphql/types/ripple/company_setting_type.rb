# frozen_string_literal: true

module Types
  module Ripple
    class CompanySettingType < Types::BaseObject
      field :value, String, null: true
      field :plural, String, null: true

      field :setting, Types::Ripple::SettingType, null: false
    end
  end
end
