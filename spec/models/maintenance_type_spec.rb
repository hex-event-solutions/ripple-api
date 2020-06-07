# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MaintenanceType do
  subject { create :maintenance_type }

  describe 'fields' do
    it { should validate_presence_of(:name) }

    it { should validate_length_of(:name).is_at_most(32) }

    it { should validate_uniqueness_of(:name) }
  end

  describe 'associations' do
    it { should have_many(:maintenance_schedules) }
  end
end