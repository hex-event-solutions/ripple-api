# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or create!d alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create!([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create!(name: 'Luke', movie: movies.first)

hex = Company.create!(
  name: 'Hex Event Solutions Limited',
  company_number: '11299813',
  address1: '72 Grove Road',
  city: 'Chichester',
  county: 'West Sussex',
  postcode: 'PO18 8AP',
  phone_number: '07817 026962',
  logo: 'https://hexes.co.uk/static/media/logo-light.1f72cb05.png'
)

individual = ClientType.create!(company: hex, name: 'Individual')
company = ClientType.create!(company: hex, name: 'Company')
charity = ClientType.create!(company: hex, name: 'Charity')

daily = MultiplierType.create!(company: hex, name: 'Daily', multiplier: 1, operand_quantity: 1, operand_type: 'day')
shortweekly = MultiplierType.create!(company: hex, name: 'Shortweekly', multiplier: 3, operand_quantity: 7, operand_type: 'day')
weekly = MultiplierType.create!(company: hex, name: 'Weekly', multiplier: 1, operand_quantity: 1, operand_type: 'week')
monthly = MultiplierType.create!(company: hex, name: 'Monthly', multiplier: 1, operand_quantity: 1, operand_type: 'month')

mt_pat = MaintenanceType.create!(company: hex, name: 'PAT Test')
mt_investigative = MaintenanceType.create!(company: hex, name: 'Investigative')
mt_preventative = MaintenanceType.create!(company: hex, name: 'Preventative')
mt_repair = MaintenanceType.create!(company: hex, name: 'Repair')

mr_disposed = MaintenanceResolution.create!(company: hex, name: 'Asset disposed of')
mr_inspection = MaintenanceResolution.create!(company: hex, name: 'Asset under inspection')
mr_complete = MaintenanceResolution.create!(company: hex, name: 'Maintenance completed')
mr_will_not_repair = MaintenanceResolution.create!(company: hex, name: 'Asset will not be repaired')

draft = DocumentState.create!(company: hex, name: 'Draft')
sent = DocumentState.create!(company: hex, name: 'Sent')
overdue = DocumentState.create!(company: hex, name: 'Overdue')
expired = DocumentState.create!(company: hex, name: 'Expired')
invoiced = DocumentState.create!(company: hex, name: 'Invoiced')
paid = DocumentState.create!(company: hex, name: 'Paid')

quote = DocumentType.create!(company: hex, name: 'Quote')
invoice = DocumentType.create!(company: hex, name: 'Invoice')
pat_report = DocumentType.create!(company: hex, name: 'PAT Report')
pick_list = DocumentType.create!(company: hex, name: 'Pick List')
mainenance_history = DocumentType.create!(company: hex, name: 'Maintenance History')

sound = Category.create!(company: hex, name: 'Sound')
active_speakers = Category.create!(company: hex, name: 'Active Speakers', parent: sound)
stage_monitors = Category.create!(company: hex, name: 'Stage Monitors', parent: sound)

cables = Category.create!(company: hex, name: 'Cables')
xlr = Category.create!(company: hex, name: 'XLR', parent: cables)

speaker = AssetType.create!(company: hex, cost: 150, rate: 5, multiplier_type: shortweekly, manufacturer: 't.box', model: 'PA110a', weight: 10, description: '180w active 2 way speaker', display_on_website: true)
cable = AssetType.create!(company: hex, cost: 9, rate: 0.5, multiplier_type: shortweekly, manufacturer: 'Hex', model: '5m XLR', weight: 0.25, description: '5m XLR', display_on_website: true)

AssetTypeCategory.create!(company: hex, asset_type: speaker, category: active_speakers)
AssetTypeCategory.create!(company: hex, asset_type: speaker, category: stage_monitors)
AssetTypeCategory.create!(company: hex, asset_type: cable, category: xlr)

Accessory.create!(company: hex, asset_type: speaker, accessory: cable, quantity: 1)

asset_case = AssetCase.create!(company: hex, barcode: 'C0000001')

asset = Asset.create!(company: hex, asset_type: speaker, asset_case: asset_case, barcode: 'A00000001')

asu = Client.create!(company: hex, organisation_name: 'Aston Students Union', discount: 0, client_type: charity)

Contact.create!(company: hex, client: asu, name: 'Nadine')

event = Event.create!(company: hex, client: asu, date_start: Time.now, date_out: Time.now + 1.minute, date_return: Time.now + 2.minutes, date_end: Time.now + 3.minutes, description: 'Gradball', location: 'TBC')

ollie = Crew.create!(company: hex, name: 'Ollie Nye', email: 'ollie@hexes.co.uk', password: '1234567890', rate: 9, price: 12)
josh = Crew.create!(company: hex, name: 'Josh Lowe', email: 'josh@hexes.co.uk', password: '1234567890', rate: 9, price: 12)

admin = Role.create!(company: hex, name: 'Admin')
contractor = Role.create!(company: hex, name: 'Contractor')

RolePrivilege.create!(company: hex, role: admin, resource: 'event', action: 'create!')
RolePrivilege.create!(company: hex, role: admin, resource: 'event', action: 'read')
RolePrivilege.create!(company: hex, role: admin, resource: 'event', action: 'update')
RolePrivilege.create!(company: hex, role: admin, resource: 'event', action: 'delete')
RolePrivilege.create!(company: hex, role: contractor, resource: 'event', action: 'read')

CrewRole.create!(company: hex, crew: ollie, role: admin)
CrewRole.create!(company: hex, crew: josh, role: contractor)

Shift.create!(company: hex, event: event, crew: ollie, start: Time.now, finish: Time.now + 1.hours, rate: ollie.rate, price: ollie.price)

AssetEvent.create!(company: hex, event: event, asset: asset)
AssetTypeEvent.create!(company: hex, event: event, asset_type: speaker, quantity: 1, discount: 0)

color = Specification.create!(company: hex, name: 'Color')

AssetTypeSpecification.create!(company: hex, asset_type: speaker, specification: color, value: 'Black')

doc = Document.create!(company: hex, client: asu, event: event, document_type: quote)

DocumentTypeField.create!(company: hex, document_type: quote, name: 'item description', resource: 'asset.assetType', property: 'fullname')
DocumentTypeField.create!(company: hex, document_type: quote, name: 'price', resource: 'documentItem', property: 'price')

other_item = RowItem.create!(company: hex, price: 15, description: 'Confetti cannon')

DocumentItem.create!(company: hex, document: doc, item: speaker, quantity: 1, discount: 0)
DocumentItem.create!(company: hex, document: doc, item: other_item, quantity: 5, discount: 20)

DocumentStateEvent.create!(company: hex, document: doc, document_state: sent)
DocumentStateEvent.create!(company: hex, document: doc, document_state: overdue)

schedule = MaintenanceSchedule.create!(company: hex, asset_type: speaker, maintenance_type: mt_pat, repeat_multiplier: 1, repeat_period: 'year')

MaintenanceEvent.create!(company: hex, maintenance_schedule: schedule, maintenance_resolution: mr_complete, asset: asset)
