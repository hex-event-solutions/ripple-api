# frozen_string_literal: true

module Mutations
  module Accessories
    class Create < AuthorizedMutation
      include Helpers::Create

      argument :asset_type_id, ID, required: true
      argument :accessory_id, ID, required: true
      argument :quantity, Int, required: true

      field :accessory, Types::Ripple::AccessoryType, null: true

      def resolve(**params)
        create(Accessory, context[:company_id], params)
      end
    end
  end
end
