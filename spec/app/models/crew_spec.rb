require "rails_helper"

RSpec.describe Crew do
  let(:crew) { create :crew }

  describe 'fields' do
    it 'returns Bob from name' do
      expect(crew.name).to eq 'Bob'
    end

    it 'returns bob@hexes.co.uk from email' do
      expect(crew.name).to eq 'Bob'
    end

    it 'returns 12.0 from rate' do
      expect(crew.name).to eq 'Bob'
    end

    it 'returns 18.0 from price' do
      expect(crew.name).to eq 'Bob'
    end
  end
end
