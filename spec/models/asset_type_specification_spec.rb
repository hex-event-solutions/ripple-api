# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AssetTypeSpecification do
  subject { build :asset_type_specification }

  describe 'fields' do
    it { should validate_presence_of(:asset_type) }
    it { should validate_presence_of(:specification) }
    it { should validate_presence_of(:value) }
  end

  describe 'associations' do
    it { should belong_to(:asset_type) }
    it { should belong_to(:specification) }
  end
end
