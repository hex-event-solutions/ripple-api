# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MaintenanceResolution do
  subject { create :maintenance_resolution }

  describe 'fields' do
    it { should validate_presence_of(:name) }

    it { should validate_length_of(:name).is_at_most(32) }

    it { should validate_uniqueness_of(:name) }
  end

  describe 'associations' do
    it { should have_many(:maintenance_events) }
  end
end
