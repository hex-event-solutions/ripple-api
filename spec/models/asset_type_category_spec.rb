# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AssetTypeCategory do
  subject { create :asset_type_category }

  describe 'fields' do
    it { should validate_presence_of(:asset_type) }
    it { should validate_presence_of(:category) }
  end

  describe 'associations' do
    it { should belong_to(:asset_type) }
    it { should belong_to(:category) }
  end
end
