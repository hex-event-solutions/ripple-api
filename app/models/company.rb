# frozen_string_literal: true

class Company < ApplicationRecord
  has_many :accessories
  has_many :assets
  has_many :asset_cases
  has_many :asset_events
  has_many :asset_types
  has_many :asset_type_categories
  has_many :asset_type_events
  has_many :asset_type_specifications
  has_many :categories
  has_many :clients
  has_many :client_types
  has_many :contacts
  has_many :crews
  has_many :crew_roles
  has_many :documents
  has_many :document_items
  has_many :document_states
  has_many :document_state_events
  has_many :document_types
  has_many :document_type_fields
  has_many :events
  has_many :items
  has_many :item_types
  has_many :maintenance_events
  has_many :maintenance_resolutions
  has_many :maintenance_schedules
  has_many :maintenance_types
  has_many :multiplier_types
  has_many :roles
  has_many :role_privileges
  has_many :shifts
  has_many :specifications

  validates :name, :address1, :city, :county, :postcode, :phone_number, presence: true
end
