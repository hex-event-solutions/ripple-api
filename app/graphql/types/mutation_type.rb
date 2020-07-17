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

    field :create_maintenance_resolution, mutation: Mutations::MaintenanceResolutions::Create
    field :update_maintenance_resolution, mutation: Mutations::MaintenanceResolutions::Update
    field :delete_maintenance_resolution, mutation: Mutations::MaintenanceResolutions::Delete

    field :create_maintenance_type, mutation: Mutations::MaintenanceTypes::Create
    field :update_maintenance_type, mutation: Mutations::MaintenanceTypes::Update
    field :delete_maintenance_type, mutation: Mutations::MaintenanceTypes::Delete
  end
end
