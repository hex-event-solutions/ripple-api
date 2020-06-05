# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AssetCase do
  subject { create :asset_case }

  describe 'fields' do
    it { should validate_presence_of(:barcode) }

    it { should validate_length_of(:barcode).is_at_most(16) }
  end

  describe 'associations' do
    it { should have_many(:assets) }
  end
end
