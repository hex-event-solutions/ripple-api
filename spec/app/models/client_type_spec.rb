# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ClientType do
  let(:client_type) { create :client_type }

  describe 'fields' do
    it 'returns Individual from name' do
      expect(client_type.name).to eq 'Individual'
    end
  end
end
