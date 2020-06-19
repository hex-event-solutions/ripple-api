# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :asset_types, [Types::RippleAssetTypeType], null: false, description: 'Returns all asset types'
    field :asset_cases, [Types::RippleAssetCaseType], null: false, description: 'Returns all asset cases'
    field :assets, [Types::RippleAssetType], null: false, description: 'Returns all assets'
    field :categories, [Types::RippleCategoryType], null: false, description: 'Returns all categories'
    field :client_types, [Types::RippleClientTypeType], null: false, description: 'Returns all client types'
    field :clients, [Types::RippleClientType], null: false, description: 'Returns all clients'
    field :crew, [Types::RippleCrewType], null: false, description: 'Returns all crew'
    field :document_states, [Types::RippleDocumentStateType], null: false, description: 'Returns all document states'
    field :document_types, [Types::RippleDocumentTypeType], null: false, description: 'Returns all document types'
    field :documents, [Types::RippleDocumentType], null: false, description: 'Returns all documents'
    field :events, [Types::RippleEventType], null: false, description: 'Returns all events'
    field :maintenance_resolutions,
          [Types::RippleMaintenanceResolutionType],
          null: false,
          description: 'Returns all maintenance resolutions'
    field :maintenance_types,
          [Types::RippleMaintenanceTypeType],
          null: false,
          description: 'Returns all maintenance types'
    field :multiplier_types, [Types::RippleMultiplierTypeType], null: false, description: 'Returns all multiplier types'
    field :roles, [Types::RippleRoleType], null: false, description: 'Returns all roles'
    field :row_items, [Types::RippleRowItemType], null: false, description: 'Returns all row items'
    field :specifications, [Types::RippleSpecificationType], null: false, description: 'Returns all specificaions'

    def asset_types
      AssetType.where(company_id: context[:company_id])
    end

    def asset_cases
      AssetCase.where(company_id: context[:company_id])
    end

    def assets
      Asset.where(company_id: context[:company_id])
    end

    def categories
      Category.where(company_id: context[:company_id])
    end

    def client_types
      ClientType.where(company_id: context[:company_id])
    end

    def clients
      Client.where(company_id: context[:company_id])
    end

    def crew
      Crew.where(company_id: context[:company_id])
    end

    def document_states
      DocumentState.where(company_id: context[:company_id])
    end

    def document_types
      DocumentType.where(company_id: context[:company_id])
    end

    def documents
      Document.where(company_id: context[:company_id])
    end

    def events
      Event.where(company_id: context[:company_id])
    end

    def maintenance_resolutions
      MaintenanceResolution.where(company_id: context[:company_id])
    end

    def maintenance_types
      MaintenanceType.where(company_id: context[:company_id])
    end

    def multiplier_types
      MultiplierType.where(company_id: context[:company_id])
    end

    def roles
      Role.where(company_id: context[:company_id])
    end

    def row_items
      RowItem.where(company_id: context[:company_id])
    end

    def specifications
      Specification.where(company_id: context[:company_id])
    end
  end
end
