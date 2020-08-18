# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :create_company, mutation: Mutations::Companies::Create

    field :create_client_type, mutation: Mutations::ClientTypes::Create
    field :update_client_type, mutation: Mutations::ClientTypes::Update
    field :delete_client_type, mutation: Mutations::ClientTypes::Delete

    field :create_document_state, mutation: Mutations::DocumentStates::Create
    field :update_document_state, mutation: Mutations::DocumentStates::Update
    field :delete_document_state, mutation: Mutations::DocumentStates::Delete

    field :create_document_type, mutation: Mutations::DocumentTypes::Create
    field :update_document_type, mutation: Mutations::DocumentTypes::Update
    field :delete_document_type, mutation: Mutations::DocumentTypes::Delete

    field :create_document, mutation: Mutations::Documents::Create

    field :create_maintenance_resolution, mutation: Mutations::MaintenanceResolutions::Create
    field :update_maintenance_resolution, mutation: Mutations::MaintenanceResolutions::Update
    field :delete_maintenance_resolution, mutation: Mutations::MaintenanceResolutions::Delete

    field :create_maintenance_type, mutation: Mutations::MaintenanceTypes::Create
    field :update_maintenance_type, mutation: Mutations::MaintenanceTypes::Update
    field :delete_maintenance_type, mutation: Mutations::MaintenanceTypes::Delete

    field :generate_document, mutation: Mutations::Documents::Generate

    field :test_document_type, mutation: Mutations::DocumentTypes::Generate

    field :create_asset_type, mutation: Mutations::AssetTypes::Create
    field :update_asset_type, mutation: Mutations::AssetTypes::Update
    field :delete_asset_type, mutation: Mutations::AssetTypes::Delete

    field :create_asset, mutation: Mutations::Assets::Create
    field :update_asset, mutation: Mutations::Assets::Update
    field :delete_asset, mutation: Mutations::Assets::Delete

    field :create_accessory, mutation: Mutations::Accessories::Create
    field :delete_accessory, mutation: Mutations::Accessories::Delete

    field :create_asset_type_category, mutation: Mutations::AssetTypeCategories::Create
    field :delete_asset_type_category, mutation: Mutations::AssetTypeCategories::Delete

    field :create_asset_type_specification, mutation: Mutations::AssetTypeSpecifications::Create
    field :delete_asset_type_specification, mutation: Mutations::AssetTypeSpecifications::Delete

    field :create_asset_type_multiplier_type, mutation: Mutations::AssetTypeMultiplierTypes::Create
    field :delete_asset_type_multiplier_type, mutation: Mutations::AssetTypeMultiplierTypes::Delete

    field :upload_image, mutation: Mutations::Images::Upload
    field :create_image, mutation: Mutations::Images::Create
    field :delete_image, mutation: Mutations::Images::Delete

    field :create_event, mutation: Mutations::Events::Create
    field :update_event, mutation: Mutations::Events::Update
    field :delete_event, mutation: Mutations::Events::Delete

    field :create_event_item, mutation: Mutations::EventItems::Create
    field :delete_event_item, mutation: Mutations::EventItems::Delete

    field :create_client, mutation: Mutations::Clients::Create
    field :update_client, mutation: Mutations::Clients::Update
    field :delete_client, mutation: Mutations::Clients::Delete
  end
end
