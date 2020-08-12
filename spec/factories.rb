# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :accessory do
    company
    asset_type { build(:asset_type, company: company) }
    accessory { build(:asset_type, company: company) }
    quantity { Faker::Number.decimal(l_digits: 1) }
  end

  factory :asset do
    company
    asset_type { build(:asset_type, company: company) }
    asset_case { build(:asset_case, company: company) }
    barcode { Faker::Internet.password }
  end

  factory :asset_type_category do
    company
    asset_type { build(:asset_type, company: company) }
    category { build(:category, company: company) }
  end

  factory :asset_type do
    company
    cost { Faker::Number.decimal(l_digits: 2) }
    rate { Faker::Number.decimal(l_digits: 2) }
    display_on_website { Faker::Boolean.boolean }
    manufacturer { Faker::Company.name }
    model { Faker::App.name }
    weight { Faker::Number.decimal(l_digits: 2) }
    description { Faker::Lorem.paragraph }
  end

  factory :asset_type_multiplier_type do
    company
    multiplier_type { build(:multiplier_type, company: company) }
    asset_type { build(:asset_type, company: company) }
  end

  factory :asset_type_specification do
    company
    asset_type { build(:asset_type, company: company) }
    specification { build(:specification, company: company) }
    value { Faker::Verb.base }
  end

  factory :asset_case do
    company
    barcode { Faker::Internet.password }
  end

  factory :category do
    company
    name { 'Sound' }
    parent { build(:category, name: 'Equipment', parent: nil, company: company) }
  end

  factory :client do
    company
    client_type { build(:client_type, company: company) }
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
    client { build(:client, company: company) }
    name { Faker::Name.name }
    email { Faker::Internet.email }
    phone { Faker::PhoneNumber.cell_phone }
    details { Faker::Lorem.paragraph }
  end

  factory :document do
    company
    document_type { build(:document_type, company: company) }
    subject_id { '123' }
  end

  factory :document_item do
    company
    document { build(:document, company: company) }
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
    document_state { build(:document_state, company: company) }
    document { build(:document, company: company) }
    details { Faker::Lorem.paragraph }
  end

  factory :document_type do
    company
    name { ['Quote', 'Invoice', 'PAT Report', 'Pick List'].sample }
    template { '<p>Hello</p>' }
    subject { 'Event' }
  end

  factory :event do
    company
    client { build(:client, company: company) }
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
    maintenance_schedule { build(:maintenance_schedule, company: company) }
    maintenance_resolution { build(:maintenance_resolution, company: company) }
    asset { build(:asset, company: company) }
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
    asset_type { build(:asset_type, company: company) }
    maintenance_type { build(:maintenance_type, company: company) }
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
    multiplier_type { %w[hour day week month year].sample }
    operand_type { %w[hour day week month year].sample }
    operand_quantity { Faker::Number.decimal(l_digits: 2) }
  end

  factory :row_item do
    company
    price { Faker::Number.decimal(l_digits: 2) }
    description { Faker::Lorem.paragraph }
  end

  factory :shift do
    company
    crew_id { 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa'}
    event { build(:event, company: company) }
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
