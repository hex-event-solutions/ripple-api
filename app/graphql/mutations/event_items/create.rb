# frozen_string_literal: true

module Mutations
  module EventItems
    class Create < AuthorizedMutation
      include Helpers::Create

      argument :event_id, Types::BaseObject::ID, required: true
      argument :asset_type_id, Types::BaseObject::ID, required: false
      argument :asset_id, Types::BaseObject::ID, required: false
      argument :row_item, String, required: false
      argument :row_item_price, Float, required: false
      argument :quantity, Integer, required: true
      argument :discount, Integer, required: true

      field :event_item, Types::Ripple::EventItemType, null: true

      def resolve(**params)
        item = find_or_create_item(**params)

        event_item = EventItem.find_by(company_id: context[:company_id], event_id: params[:event_id], item: item)

        if event_item && event_item.discount == params[:discount]
          event_item.quantity += params[:quantity]
          event_item.save
          return { event_item: event_item }
        end

        create_params = {
          event_id: params[:event_id],
          item: item,
          quantity: params[:quantity],
          discount: params[:discount]
        }

        create(EventItem, context[:company_id], create_params)
      end

      def find_or_create_item(**params)
        if params[:asset_type_id]
          AssetType.find_by!(company_id: context[:company_id], id: params[:asset_type_id])
        elsif params[:asset_id]
          Asset.find_by!(company_id: context[:company_id], id: params[:asset_id])
        elsif params[:row_item] && params[:row_item_price]
          RowItem.find_or_create_by(
            company_id: context[:company_id],
            description: params[:row_item],
            price: params[:row_item_price]
          )
        end
      end
    end
  end
end
