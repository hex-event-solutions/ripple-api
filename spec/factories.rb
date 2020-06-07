# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :accessory do
    company
    asset_type { create(:asset_type, company: company) }
    accessory { create(:asset_type, company: company, multiplier_type: asset_type.multiplier_type) }
    quantity { Faker::Number.decimal(l_digits: 1) }
  end

  factory :asset_event do
    company
    asset { create(:asset, company: company) }
    event { create(:event, company: company) }
  end

  factory :asset do
    company
    asset_type { create(:asset_type, company: company) }
    asset_case { create(:asset_case, company: company) }
    barcode { Faker::Internet.password }
  end

  factory :asset_type_category do
    company
    asset_type { create(:asset_type, company: company) }
    category { create(:category, company: company) }
  end

  factory :asset_type_event do
    company
    asset_type { create(:asset_type, company: company) }
    event { create(:event, company: company) }
    quantity { Faker::Number.decimal(l_digits: 2) }
    discount { Faker::Number.number(digits: 2) }
  end

  factory :asset_type do
    company
    multiplier_type { create(:multiplier_type, company: company) }
    cost { Faker::Number.decimal(l_digits: 2) }
    rate { Faker::Number.decimal(l_digits: 2) }
    display_on_website { Faker::Boolean.boolean }
    manufacturer { Faker::Company.name }
    model { Faker::App.name }
    weight { Faker::Number.decimal(l_digits: 2) }
    description { Faker::Lorem.paragraph }
  end

  factory :asset_type_specification do
    company
    asset_type { create(:asset_type, company: company) }
    specification { create(:specification, company: company) }
    value { Faker::Verb.base }
  end

  factory :asset_case do
    company
    barcode { Faker::Internet.password }
  end

  factory :category do
    company
    name { 'Sound' }
    parent { create(:category, name: 'Equipment', parent: nil, company: company) }
  end

  factory :client do
    company
    client_type { create(:client_type, company: company) }
    organisation_name { Faker::Company.name }
    address1 { Faker::Address.street_address }
    address2 { Faker::Address.secondary_address }
    address3 { Faker::Address.building_number }
    city { Faker::Address.city }
    county { Faker::Address.community }
    postcode { Faker::Address.postcode }
    discount { Faker::Number.number(digits: 2) }
  end

  factory :client_type do
    company
    name { %w[Individual Company].sample }
  end

  factory :company do
    name { Faker::Company.name }
    vat_number { Faker::Finance.vat_number }
    company_number { Faker::Number.number(digits: 8) }
    address1 { Faker::Address.street_address }
    address2 { Faker::Address.secondary_address }
    address3 { Faker::Address.building_number }
    city { Faker::Address.city }
    county { Faker::Address.community }
    postcode { Faker::Address.postcode }
    phone_number { Faker::PhoneNumber.cell_phone }
    logo { Faker::Company.logo }
  end

  factory :contact do
    company
    client { create(:client, company: company) }
    name { Faker::Name.name }
    email { Faker::Internet.email }
    phone { Faker::PhoneNumber.cell_phone }
    details { Faker::Lorem.paragraph }
  end

  factory :crew_role do
    company
    crew { create(:crew, company: company) }
    role { create(:role, company: company) }
  end

  factory :crew do
    company
    name { Faker::Name.name }
    email { Faker::Internet.email }
    rate { Faker::Number.decimal(l_digits: 2) }
    price { Faker::Number.decimal(l_digits: 2) }
    password { Faker::Internet.password }
  end

  factory :document do
    company
    client { create(:client, company: company) }
    event { create(:event, client: client, company: company) }
    document_type { create(:document_type, company: company) }
  end

  factory :document_item do
    company
    document { create(:document, company: company) }
    for_row_item
    quantity { Faker::Number.decimal(l_digits: 2) }
    discount { Faker::Number.number(digits: 2) }

    trait :for_row_item do
      association :item, factory: :row_item
    end

    trait :for_asset_type do
      association :item, factory: :asset_type
    end
  end

  factory :document_state do
    company
    name { %w[Draft Sent Overdue Expired Invoiced Paid].sample }
  end

  factory :document_state_event do
    company
    document_state { create(:document_state, company: company) }
    document { create(:document, company: company) }
    details { Faker::Lorem.paragraph }
  end

  factory :document_type do
    company
    name { ['Quote', 'Invoice', 'PAT Report', 'Pick List'].sample }
  end

  factory :document_type_field do
    company
    document_type { create(:document_type, company: company) }
    name { ['Model', 'Manufacturer', 'Price', 'Cost', 'Test date'].sample }
    resource { %w[MaintenanceEvent AssetType Event Accessory].sample }
    property { %w[model manufacturer price cost date_updated].sample }
  end

  factory :event do
    company
    client { create(:client, company: company) }
    date_start { Faker::Date.in_date_period(month: 1) }
    date_out { Faker::Date.in_date_period(month: 2) }
    date_return { Faker::Date.in_date_period(month: 3) }
    date_end { Faker::Date.in_date_period(month: 4) }
    description { Faker::Lorem.paragraph }
    details { Faker::Lorem.paragraph }
    location { Faker::Lorem.paragraph }
  end

  factory :maintenance_event do
    company
    maintenance_schedule { create(:maintenance_schedule, company: company) }
    maintenance_resolution { create(:maintenance_resolution, company: company) }
    asset { create(:asset, company: company) }
    details { Faker::Lorem.paragraph }
  end

  factory :maintenance_resolution do
    company
    name do
      [
        'Asset disposed of',
        'Asset under inspection',
        'Maintenance completed',
        'Asset will not be repaired'
      ].sample
    end
  end

  factory :maintenance_schedule do
    company
    asset_type { create(:asset_type, company: company) }
    maintenance_type { create(:maintenance_type, company: company) }
    details { Faker::Lorem.paragraph }
    repeat_period { %w[day week month year].sample }
    repeat_multiplier { [1, 2, 3, 4].sample }
  end

  factory :maintenance_type do
    company
    name { ['PAT Test', 'Investigative', 'Preventative', 'Repair'].sample }
  end

  factory :multiplier_type do
    company
    name { %w[Daily Shortweekly Weekly Monthly].sample }
    multiplier { Faker::Number.decimal(l_digits: 2) }
    operand_type { %w[day week month year].sample }
    operand_quantity { Faker::Number.decimal(l_digits: 2) }
  end

  factory :role_privilege do
    company
    role { create(:role, company: company) }
    action { %w[create read update delete].sample }
    resource { Faker::Movies::Hobbit.location }
  end

  factory :role do
    company
    name { Faker::Movies::Hobbit.character }
  end

  factory :row_item do
    company
    price { Faker::Number.decimal(l_digits: 2) }
    description { Faker::Lorem.paragraph }
  end

  factory :shift do
    company
    crew { create(:crew, company: company) }
    event { create(:event, company: company) }
    start { Faker::Date.in_date_period(month: 1) }
    finish { Faker::Date.in_date_period(month: 2) }
    rate { Faker::Number.decimal(l_digits: 2) }
    price { Faker::Number.decimal(l_digits: 2) }
  end

  factory :specification do
    company
    name { Faker::Movies::Hobbit.character }
  end
end
