# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MaintenanceEvent do
  subject { create :maintenance_event }

  describe 'fields' do
    it { should validate_presence_of(:maintenance_schedule) }
    it { should validate_presence_of(:maintenance_resolution) }
    it { should validate_presence_of(:asset) }
    it { should validate_presence_of(:details) }
  end

  describe 'associations' do
    it { should belong_to(:maintenance_schedule) }
    it { should belong_to(:maintenance_resolution) }
    it { should belong_to(:asset) }
  end
end
