# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Crew do
  subject { create :crew }

  describe 'fields' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:rate) }
    it { should validate_presence_of(:price) }

    it { should validate_length_of(:name).is_at_most(128) }
    it { should validate_length_of(:email).is_at_most(255) }

    it { should validate_uniqueness_of(:name).scoped_to(:company_id) }
    it { should validate_uniqueness_of(:email).scoped_to(:company_id) }

    it { should validate_numericality_of(:rate) }
    it { should validate_numericality_of(:price) }
  end

  describe 'associations' do
    it { should have_many(:crew_roles) }
    it { should have_many(:shifts) }
  end
end
