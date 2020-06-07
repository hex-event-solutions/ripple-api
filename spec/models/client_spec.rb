# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Client, type: :model do
  subject { create :client }

  describe 'fields' do
    it { should validate_presence_of(:organisation_name) }
    it { should validate_presence_of(:discount) }

    it { should validate_length_of(:organisation_name).is_at_most(128) }
    it { should validate_length_of(:address1).is_at_most(64) }
    it { should validate_length_of(:address2).is_at_most(64) }
    it { should validate_length_of(:address3).is_at_most(64) }
    it { should validate_length_of(:city).is_at_most(64) }
    it { should validate_length_of(:county).is_at_most(64) }
    it { should validate_length_of(:postcode).is_at_most(10) }

    it { should validate_numericality_of(:discount) }

    it { should validate_uniqueness_of(:organisation_name).scoped_to(:company) }
  end

  describe 'associations' do
    it { should belong_to(:client_type) }
  end
end
