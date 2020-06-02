# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Contact do
  let!(:client) { create :client }
  let!(:contact) { create(:contact, client: client) }

  describe 'fields' do
    it 'returns Some guy from name' do
      expect(contact.name).to eq 'Some guy'
    end

    it 'returns someguy@hexes.co.uk from email' do
      expect(contact.email).to eq 'someguy@hexes.co.uk'
    end

    it 'returns 01234567890 from phone' do
      expect(contact.phone).to eq '01234567890'
    end

    it 'returns Some details from details' do
      expect(contact.details).to eq 'Some details'
    end
  end

  describe 'associations' do
    it 'returns client from client' do
      expect(contact.client).to be client
    end
  end
end
