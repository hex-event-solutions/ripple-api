# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MaintenanceEvent do
  subject { build :maintenance_event }

  describe 'fields' do
    it { should validate_presence_of(:maintenance_resolution) }
    it { should validate_presence_of(:asset) }
  end

  describe 'associations' do
    it { should belong_to(:maintenance_schedule).without_validating_presence }
    it { should belong_to(:maintenance_type).without_validating_presence }
    it { should belong_to(:maintenance_resolution) }
    it { should belong_to(:asset) }
  end
end
