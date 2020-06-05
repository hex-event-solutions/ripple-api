# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AssetEvent do
  subject { create :asset_event }

  describe 'fields' do
    it { should validate_presence_of(:asset) }
    it { should validate_presence_of(:event) }
  end

  describe 'associations' do
    it { should belong_to(:asset) }
    it { should belong_to(:event) }
  end
end
