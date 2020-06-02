# frozen_string_literal: true

FactoryBot.define do
  factory :crew do
    name { 'Bob' }
    email { 'bob@hexes.co.uk' }
    price { 18.0 }
    rate { 12.0 }
  end

  factory :role do
    name { 'Admin' }
  end

  factory :role_privilege do
    role
    action { 'create' }
    resource { 'asset' }
  end

  factory :crew_role do
    crew
    role
  end

  factory :client_type do
    name { 'Individual' }
  end

  factory :client do
    client_type
    organisation_name { 'Hex Event Solutions Limited' }
    address1 { '72 Grove Road' }
    address2 { 'Floor 1' }
    address3 { 'Room 64' }
    city { 'Chichester' }
    county { 'West Sussex' }
    postcode { 'PO19 8AP' }
    discount { 10 }
  end

  factory :contact do
    client
    name { 'Some guy' }
    email { 'someguy@hexes.co.uk' }
    phone { '01234567890' }
    details { 'Some details' }
  end
end
