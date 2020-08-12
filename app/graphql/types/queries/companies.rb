# frozen_string_literal: true

module Types
  module Queries
    module Companies
      def self.included(base)
        base.field :companies, [Types::Ripple::CompanyType], null: false, description: 'Returns all companies'
      end

      def companies
        Company.all
      end
    end
  end
end
