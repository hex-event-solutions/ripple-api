# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Company do
  subject { build :company }

  describe 'fields' do
    it { should validate_presence_of(:name) }
  end

  describe 'associations' do
    it { should have_many(:accessories) }
    it { should have_many(:assets) }
    it { should have_many(:asset_cases) }
    it { should have_many(:asset_types) }
    it { should have_many(:asset_type_categories) }
    it { should have_many(:asset_type_specifications) }
    it { should have_many(:categories) }
    it { should have_many(:clients) }
    it { should have_many(:client_types) }
    it { should have_many(:contacts) }
    it { should have_many(:documents) }
    it { should have_many(:document_states) }
    it { should have_many(:document_state_events) }
    it { should have_many(:document_types) }
    it { should have_many(:events) }
    it { should have_many(:images) }
    it { should have_many(:maintenance_events) }
    it { should have_many(:maintenance_resolutions) }
    it { should have_many(:maintenance_schedules) }
    it { should have_many(:maintenance_types) }
    it { should have_many(:multiplier_types) }
    it { should have_many(:resource_images) }
    it { should have_many(:row_items) }
    it { should have_many(:shifts) }
    it { should have_many(:specifications) }
  end
end
