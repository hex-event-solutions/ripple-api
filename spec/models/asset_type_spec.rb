# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AssetType do
  subject { create :asset_type }

  describe 'fields' do
    it { should validate_presence_of(:cost) }
    it { should validate_presence_of(:rate) }
    it { should validate_presence_of(:manufacturer) }
    it { should validate_presence_of(:model) }
    it { should validate_presence_of(:weight) }
    it { should validate_presence_of(:description) }

    it { should validate_numericality_of(:cost) }
    it { should validate_numericality_of(:rate) }
    it { should validate_numericality_of(:weight) }

    it { should validate_length_of(:manufacturer).is_at_most(64) }
    it { should validate_length_of(:model).is_at_most(64) }
  end

  describe 'associations' do
    it { should have_many(:assets) }
    it { should have_many(:maintenance_schedules) }
    it { should have_many(:asset_type_specifications) }
    it { should have_many(:asset_type_categories) }
    it { should have_many(:accessories) }
    it { should have_many(:multiplier_types) }
  end
end
