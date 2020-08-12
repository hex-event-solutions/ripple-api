# frozen_string_literal: true

module Types
  module Queries
    module RowItems
      def self.included(base)
        base.field :row_items, [Types::Ripple::RowItemType], null: false, description: 'Returns all row items'
      end

      def row_items
        RowItem.where(company_id: context[:company_id]).without_templates
      end
    end
  end
end
