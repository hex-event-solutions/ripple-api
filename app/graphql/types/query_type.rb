# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    include Types::Queries::AssetCases
    include Types::Queries::AssetTypes
    include Types::Queries::Assets
    include Types::Queries::Categories
    include Types::Queries::ClientTypes
    include Types::Queries::Clients
    include Types::Queries::Companies
    include Types::Queries::Crew
    include Types::Queries::Dashboard
    include Types::Queries::DocumentStates
    include Types::Queries::DocumentTypes
    include Types::Queries::Documents
    include Types::Queries::Events
    include Types::Queries::MaintenanceResolutions
    include Types::Queries::MaintenanceTypes
    include Types::Queries::MultiplierTypes
    include Types::Queries::RowItems
    include Types::Queries::Specifications
  end
end
