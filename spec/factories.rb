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

  factory :crew_role do
    crew
    role
  end

  factory :role_privilege do
    role
    action { 'create' }
    resource { 'asset' }
  end
end
