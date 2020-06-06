# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

hex = Company.create(
  name: 'Hex Event Solutions Limited',
  company_number: '11299813',
  address1: '72 Grove Road',
  city: 'Chichester',
  county: 'West Sussex',
  postcode: 'PO18 8AP',
  phone_number: '07817 026962',
  logo: 'https://hexes.co.uk/static/media/logo-light.1f72cb05.png'
)

ClientType.create(company: hex, name: 'Individual')
ClientType.create(company: hex, name: 'Company')

MultiplierType.create(
  company: hex,
  name: 'Daily',
  multiplier: 1,
  operand_quantity: 1,
  operand_type: 'day'
)
MultiplierType.create(
  company: hex,
  name: 'Shortweekly',
  multiplier: 3,
  operand_quantity: 7,
  operand_type: 'day'
)

MultiplierType.create(
  company: hex,
  name: 'Weekly',
  multiplier: 1,
  operand_quantity: 1,
  operand_type: 'week'
)
MultiplierType.create(
  company: hex,
  name: 'Monthly',
  multiplier: 1,
  operand_quantity: 1,
  operand_type: 'month'
)

MaintenanceType.create(company: hex, name: 'PAT Test')
MaintenanceType.create(company: hex, name: 'Investigative')
MaintenanceType.create(company: hex, name: 'Preventative')
MaintenanceType.create(company: hex, name: 'Repair')

MaintenanceResolution.create(company: hex, name: 'Asset disposed of')
MaintenanceResolution.create(company: hex, name: 'Asset under inspection')
MaintenanceResolution.create(company: hex, name: 'Maintenance completed')
MaintenanceResolution.create(company: hex, name: 'Asset will not be repaired')

DocumentState.create(company: hex, name: 'Draft')
DocumentState.create(company: hex, name: 'Sent')
DocumentState.create(company: hex, name: 'Overdue')
DocumentState.create(company: hex, name: 'Expired')
DocumentState.create(company: hex, name: 'Invoiced')
DocumentState.create(company: hex, name: 'Paid')

DocumentType.create(company: hex, name: 'Quote')
DocumentType.create(company: hex, name: 'Invoice')
DocumentType.create(company: hex, name: 'PAT Report')
DocumentType.create(company: hex, name: 'Pick List')
DocumentType.create(company: hex, name: 'Maintenance History')
