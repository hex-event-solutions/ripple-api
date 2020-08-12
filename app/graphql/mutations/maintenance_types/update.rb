# frozen_string_literal: true

module Mutations
  module MaintenanceTypes
    class Update < AuthorizedMutation
      include Helpers::Update

      argument :id, ID, required: true
      argument :name, String, required: true

      field :maintenance_type, Types::Ripple::MaintenanceTypeType, null: true

      def resolve(id:, **params)
        update(MaintenanceType, id, params)
      end
    end
  end
end
