# frozen_string_literal: true

module Types
  module Queries
    module Categories
      def self.included(base)
        base.field :categories, [Types::Ripple::CategoryType], null: false, description: 'Returns all categories' do
          argument :root, Types::BaseObject::Boolean, required: false
        end
      end

      def categories(root: false)
        cats = Category.where(company_id: context[:company_id]).without_templates

        return cats unless root

        cats.where(parent_id: nil)
      end
    end
  end
end
