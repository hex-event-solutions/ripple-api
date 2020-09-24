# frozen_string_literal: true

module Mutations
  module CompanySettings
    class Update < AuthorizedMutation
      include Helpers::Update

      argument :id, ID, required: true
      argument :value, String, required: true

      field :company_setting, Types::Ripple::CompanySettingType, null: false

      def resolve(id:, **params)
        update(Client, id, params)
      end
    end
  end
end
