# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ClientType.create(name: 'Individual')
ClientType.create(name: 'Company')

MultiplierType.create(
  name: 'Daily',
  multiplier: 1,
  operand_quantity: 1,
  operand_type: 'day'
)
MultiplierType.create(
  name: 'Shortweekly',
  multiplier: 3,
  operand_quantity: 7,
  operand_type: 'day'
)

MultiplierType.create(
  name: 'Weekly',
  multiplier: 1,
  operand_quantity: 1,
  operand_type: 'week'
)
MultiplierType.create(
  name: 'Monthly',
  multiplier: 1,
  operand_quantity: 1,
  operand_type: 'month'
)

MaintenanceType.create(name: 'PAT Test')
MaintenanceType.create(name: 'Investigative')
MaintenanceType.create(name: 'Preventative')
MaintenanceType.create(name: 'Repair')

MaintenanceResolution.create(name: 'Asset disposed of')
MaintenanceResolution.create(name: 'Asset under inspection')
MaintenanceResolution.create(name: 'Maintenance completed')
MaintenanceResolution.create(name: 'Asset will not be repaired')

DocumentState.create(name: 'Draft')
DocumentState.create(name: 'Sent')
DocumentState.create(name: 'Overdue')
DocumentState.create(name: 'Expired')
DocumentState.create(name: 'Invoiced')
DocumentState.create(name: 'Paid')

ItemType.create(name: 'Asset')
ItemType.create(name: 'Line item')
