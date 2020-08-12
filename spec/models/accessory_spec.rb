# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Accessory do
  subject { build :accessory }

  describe 'fields' do
    it { should validate_presence_of(:asset_type) }
    it { should validate_presence_of(:accessory) }
    it { should validate_presence_of(:quantity) }

    it { should validate_numericality_of(:quantity) }
  end

  describe 'associations' do
    it { should belong_to(:asset_type) }
    it { should belong_to(:accessory) }
  end
end
