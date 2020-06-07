# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Asset do
  subject { create :asset }

  describe 'fields' do
    it { should validate_presence_of(:asset_type) }
    it { should validate_presence_of(:barcode) }

    it { should validate_length_of(:barcode).is_at_most(16) }
  end

  describe 'associations' do
    it { should have_many(:asset_events) }
    it { should have_many(:maintenance_events) }

    it { should belong_to(:asset_type) }
  end
end
