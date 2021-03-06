# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MaintenanceSchedule do
  subject { build :maintenance_schedule }

  describe 'fields' do
    it { should validate_presence_of(:asset_type) }
    it { should validate_presence_of(:maintenance_type) }
    it { should validate_presence_of(:repeat_multiplier) }
    it { should validate_presence_of(:repeat_period) }

    it { should validate_numericality_of(:repeat_multiplier) }
  end

  describe 'associations' do
    it { should have_many(:maintenance_events) }

    it { should belong_to(:asset_type) }
    it { should belong_to(:maintenance_type) }
  end
end
