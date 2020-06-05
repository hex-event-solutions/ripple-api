# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Shift do
  subject { create :shift }

  describe 'fields' do
    it { should validate_presence_of(:crew) }
    it { should validate_presence_of(:event) }
    it { should validate_presence_of(:start) }
    it { should validate_presence_of(:finish) }
    it { should validate_presence_of(:rate) }
    it { should validate_presence_of(:price) }

    it { should validate_numericality_of(:rate) }
    it { should validate_numericality_of(:price) }
  end

  describe 'associations' do
    it { should belong_to(:crew) }
    it { should belong_to(:event) }
  end
end
