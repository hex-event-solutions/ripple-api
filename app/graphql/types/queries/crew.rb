# frozen_string_literal: true

module Types
  module Queries
    module Crew
      def self.included(base)
        base.field :crew, [Types::Ripple::CrewType], null: false, description: 'Returns all crew'
      end

      def crew
        Crew.where(company_id: context[:company_id]).without_templates
      end
    end
  end
end
