# frozen_string_literal: true

module Types
  module Queries
    module Settings
      def self.included(base)
        base.field :settings,
                   [Types::Ripple::CompanySettingType],
                   null: false,
                   description: 'Returns all settings'
      end

      def settings
        CompanySetting.with(context[:company_id])
      end
    end
  end
end
