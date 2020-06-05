# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AssetTypeEvent do
  subject { create :asset_type_event }

  describe 'fields' do
    it { should validate_presence_of(:asset_type) }
    it { should validate_presence_of(:event) }
    it { should validate_presence_of(:quantity) }
    it { should validate_presence_of(:discount) }

    it { should validate_numericality_of(:quantity) }
    it { should validate_numericality_of(:discount) }
  end

  describe 'associations' do
    it { should belong_to(:asset_type) }
    it { should belong_to(:event) }
  end
end
