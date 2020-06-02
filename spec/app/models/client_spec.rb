# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Client do
  let!(:client_type) { create :client_type }
  let!(:client) { create(:client, client_type: client_type) }

  describe 'fields' do
    it 'returns Hex Event Solutions Limited from organisation_name' do
      expect(client.organisation_name).to eq 'Hex Event Solutions Limited'
    end

    it 'returns 72 Grove Road from address1' do
      expect(client.address1).to eq '72 Grove Road'
    end

    it 'returns Floor 1 from address2' do
      expect(client.address2).to eq 'Floor 1'
    end

    it 'returns Room 64 from address3' do
      expect(client.address3).to eq 'Room 64'
    end

    it 'returns Chichester from city' do
      expect(client.city).to eq 'Chichester'
    end

    it 'returns West Sussex from county' do
      expect(client.county).to eq 'West Sussex'
    end

    it 'returns PO19 8AP from postcode' do
      expect(client.postcode).to eq 'PO19 8AP'
    end

    it 'returns 10 from discount' do
      expect(client.discount).to eq 10
    end
  end

  describe 'associations' do
    it 'returns client type from client_type' do
      expect(client.client_type).to be client_type
    end
  end
end
