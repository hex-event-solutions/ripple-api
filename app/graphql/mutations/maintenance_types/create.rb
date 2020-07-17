# frozen_string_literal: true

module Mutations
  module MaintenanceTypes
    class Create < AuthorizedMutation
      include Helpers::Create

      argument :name, String, required: true

      field :maintenance_type, Types::RippleMaintenanceTypeType, null: true

      def resolve(**params)
        create(MaintenanceType, context[:company_id], params)
      end
    end
  end
end
