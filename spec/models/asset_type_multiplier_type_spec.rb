# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AssetTypeMultiplierType do
  subject { create :asset_type_multiplier_type }

  describe 'fields' do
    it { should validate_presence_of(:company) }
    it { should validate_presence_of(:multiplier_type) }
    it { should validate_presence_of(:asset_type) }
  end

  describe 'associations' do
    it { should belong_to(:multiplier_type) }
    it { should belong_to(:asset_type) }
    it { should belong_to(:company) }
  end
end
