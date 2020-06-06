# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :asset_types, [Types::AssetTypeType], null: false, description: 'Returns all asset types'
    field :asset_cases, [Types::AssetCaseType], null: false, description: 'Returns all asset cases'
    field :assets, [Types::AssetType], null: false, description: 'Returns all assets'
    field :categories, [Types::CategoryType], null: false, description: 'Returns all categories'
    field :client_types, [Types::ClientTypeType], null: false, description: 'Returns all client types'
    field :clients, [Types::ClientType], null: false, description: 'Returns all clients'
    field :crew, [Types::CrewType], null: false, description: 'Returns all crew'
    field :document_states, [Types::DocumentStateType], null: false, description: 'Returns all document states'
    field :document_types, [Types::DocumentTypeType], null: false, description: 'Returns all document types'
    field :documents, [Types::DocumentType], null: false, description: 'Returns all documents'
    field :events, [Types::EventType], null: false, description: 'Returns all events'
    field :item_types, [Types::ItemTypeType], null: false, description: 'Returns all item types'
    field :items, [Types::ItemType], null: false, description: 'Returns all items'
    field :maintenance_resolutions,
          [Types::MaintenanceResolutionType],
          null: false,
          description: 'Returns all maintenance resolutions'
    field :maintenance_types, [Types::MaintenanceTypeType], null: false, description: 'Returns all maintenance types'
    field :multiplier_types, [Types::MultiplierType], null: false, description: 'Returns all multiplier types'
    field :roles, [Types::RoleType], null: false, description: 'Returns all roles'
    field :specifications, [Types::SpecificationType], null: false, description: 'Returns all specificaions'

    def asset_types
      AssetType.all
    end

    def asset_cases
      AssetCase.all
    end

    def assets
      Asset.all
    end

    def categories
      Category.all
    end

    def client_types
      ClientType.all
    end

    def clients
      Client.all
    end

    def crew
      Crew.all
    end

    def document_states
      DocumentState.all
    end

    def document_types
      DocumentType.all
    end

    def documents
      Document.all
    end

    def events
      Event.all
    end

    def item_types
      ItemType.all
    end

    def items
      Item.all
    end

    def maintenance_resolutions
      MaintenanceResolution.all
    end

    def maintenance_types
      MaintenanceType.all
    end

    def multiplier_types
      MultiplierType.all
    end

    def roles
      Role.all
    end

    def specifications
      Specification.all
    end
  end
end
