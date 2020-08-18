# frozen_string_literal: true

module Types
  module Queries
    module RowItems
      def self.included(base)
        base.field :row_items, [Types::Ripple::RowItemType], null: false, description: 'Returns all row items'
        base.field :row_item_descriptions, [String], null: false, description: 'All row item descriptions'
        base.field :row_item_prices, [Float], null: false, description: 'Prices for a given row item' do
          argument :description, String, required: true
        end
      end

      def row_items
        RowItem.where(company_id: context[:company_id]).without_templates
      end

      def row_item_descriptions
        RowItem.where(company_id: context[:company_id]).without_templates.map(&:description).uniq
      end

      def row_item_prices(description:)
        RowItem.where(company_id: context[:company_id], description: description).map(&:price)
      end
    end
  end
end
