# frozen_string_literal: true

class Company < ApplicationRecord
  has_many :accessories
  has_many :assets
  has_many :asset_cases
  has_many :asset_types
  has_many :asset_type_categories
  has_many :asset_type_specifications
  has_many :categories
  has_many :clients
  has_many :client_types
  has_many :contacts
  has_many :documents
  has_many :document_states
  has_many :document_state_events
  has_many :document_types
  has_many :events
  has_many :images
  has_many :maintenance_events
  has_many :maintenance_resolutions
  has_many :maintenance_schedules
  has_many :maintenance_types
  has_many :multiplier_types
  has_many :resource_images
  has_many :row_items
  has_many :shifts
  has_many :specifications
  has_one :website
  has_many :website_components

  validates :name, presence: true, uniqueness: true

  after_create :create_default_data

  mustache(
    name: ->(v) { v },
    address: ->(v) { v },
    company_number: ->(v) { v },
    vat_number: ->(v) { v }
  )

  def offboard
    offboard_dependencies
    offboard_links
    offboard_core
    offboard_types

    destroy
  end

  def create_default_data
    create_client_types
    create_multiplier_types
    create_maintenance_types
    create_maintenance_resolutions
    create_document_states
    create_settings

    create_template_data
  end

  def create_template_data
    tmpl_asset_case = AssetCase.create_template!(company: self)
    tmpl_asset_type = AssetType.create_template!(company: self)
    tmpl_asset_type2 = AssetType.create_template!(company: self, model: 'Accessory asset type')
    Accessory.create_template!(company: self, asset_type: tmpl_asset_type, accessory: tmpl_asset_type2)
    tmpl_specification = Specification.create_template!(company: self)
    AssetTypeSpecification.create_template!(
      company: self,
      asset_type: tmpl_asset_type,
      specification: tmpl_specification
    )
    tmpl_multiplier_type = MultiplierType.where(company_id: id).first
    AssetTypeMultiplierType.create_template!(
      company: self,
      asset_type: tmpl_asset_type,
      multiplier_type: tmpl_multiplier_type
    )
    tmpl_asset = Asset.create_template!(company: self, asset_type: tmpl_asset_type, asset_case: tmpl_asset_case)
    tmpl_root_category = Category.create_template!(company: self)
    tmpl_category = Category.create_template!(company: self, name: 'Template category', parent: tmpl_root_category)
    AssetTypeCategory.create_template!(company: self, asset_type: tmpl_asset_type, category: tmpl_category)
    tmpl_client_type = ClientType.where(company_id: id).first
    tmpl_client = Client.create_template!(company: self, client_type: tmpl_client_type)
    tmpl_event = Event.create_template!(company: self, client: tmpl_client)
    EventItem.create_template!(company: self, event: tmpl_event, item: tmpl_asset_type)
    tmpl_maintenance_type = MaintenanceType.where(company_id: id).first
    tmpl_maintenance_resolution = MaintenanceResolution.where(company_id: id).first
    MaintenanceEvent.create_template!(
      company: self,
      maintenance_type: tmpl_maintenance_type,
      asset: tmpl_asset,
      maintenance_resolution: tmpl_maintenance_resolution
    )
    puts 'maintenance type'
    pp tmpl_maintenance_type

    tmpl_maintenance_schedule = MaintenanceSchedule.create_template!(
      company: self,
      maintenance_type: tmpl_maintenance_type
    )
    MaintenanceEvent.create_template!(
      company: self,
      maintenance_schedule: tmpl_maintenance_schedule,
      asset: tmpl_asset,
      maintenance_resolution: tmpl_maintenance_resolution
    )
    Shift.create_template!(
      company: self,
      event: tmpl_event,
      start: tmpl_event.date_out,
      finish: tmpl_event.date_return
    )
  end

  private

  def offboard_dependencies
    Asset.where(company_id: id).each(&:destroy)
    AssetCase.where(company_id: id).each(&:destroy)
    Document.where(company_id: id).each(&:destroy)
    Contact.where(company_id: id).each(&:destroy)
    Category.where(company_id: id).each(&:destroy)
    AssetType.where(company_id: id).each(&:destroy)
  end

  def offboard_links
    MaintenanceResolution.where(company_id: id).each(&:destroy)
    MaintenanceSchedule.where(company_id: id).each(&:destroy)
  end

  def offboard_core
    Event.where(company_id: id).each(&:destroy)
    Client.where(company_id: id).each(&:destroy)
    Image.where(company_id: id).each(&:destroy)
    RowItem.where(company_id: id).each(&:destroy)
    Specification.where(company_id: id).each(&:destroy)
  end

  def offboard_types
    ClientType.where(company_id: id).each(&:destroy)
    DocumentState.where(company_id: id).each(&:destroy)
    DocumentType.where(company_id: id).each(&:destroy)
    MaintenanceType.where(company_id: id).each(&:destroy)
    MultiplierType.where(company_id: id).each(&:destroy)
    CompanySetting.where(company_id: id).each(&:destroy)
  end

  def create_client_types
    ClientType.create!(company: self, name: 'Company')
    ClientType.create!(company: self, name: 'Individual')
    ClientType.create!(company: self, name: 'Charity')
  end

  def create_multiplier_types
    MultiplierType.create!(
      company: self,
      name: 'Hourly',
      multiplier: 1,
      multiplier_type: 'hour',
      operand_quantity: 1,
      operand_type: 'hour'
    )
    MultiplierType.create!(
      company: self,
      name: 'Daily',
      multiplier: 1,
      multiplier_type: 'day',
      operand_quantity: 1,
      operand_type: 'day'
    )
    MultiplierType.create!(
      company: self,
      name: 'Shortweekly',
      multiplier: 3,
      multiplier_type: 'day',
      operand_quantity: 7,
      operand_type: 'day'
    )
  end

  def create_maintenance_types
    MaintenanceType.create!(company: self, name: 'Preventative')
    MaintenanceType.create!(company: self, name: 'Investigative')
    MaintenanceType.create!(company: self, name: 'Repair')
    MaintenanceType.create!(company: self, name: 'Routine')
    MaintenanceType.create!(company: self, name: 'PAT')
  end

  def create_maintenance_resolutions
    MaintenanceResolution.create!(company: self, name: 'Asset disposed of')
    MaintenanceResolution.create!(company: self, name: 'Asset under inspection')
    MaintenanceResolution.create!(company: self, name: 'Asset will not be repaired')
    MaintenanceResolution.create!(company: self, name: 'Passed')
    MaintenanceResolution.create!(company: self, name: 'Failed')
    MaintenanceResolution.create!(company: self, name: 'Completed')
  end

  def create_document_states
    DocumentState.create!(company: self, name: 'Draft')
    DocumentState.create!(company: self, name: 'Sent')
    DocumentState.create!(company: self, name: 'Overdue')
    DocumentState.create!(company: self, name: 'Expired')
    DocumentState.create!(company: self, name: 'Invoiced')
    DocumentState.create!(company: self, name: 'Paid')
  end

  def create_settings
    CompanySetting.create!(
      company: self,
      setting: Setting.find_by!(name: 'Asset barcode pattern'),
      value: '(000000)'
    )
    CompanySetting.create!(
      company: self,
      setting: Setting.find_by!(name: 'Asset case barcode pattern'),
      value: '(000000)'
    )
  end
end
