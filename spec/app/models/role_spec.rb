# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Role do
  let!(:role) { create :role }

  describe 'fields' do
    it 'returns Admin from name' do
      expect(role.name).to eq 'Admin'
    end
  end

  describe 'associations' do
    let!(:crew_role) { create :crew_role, role: role }
    it 'has a CrewRole association' do
      expect(role.crew_roles).to include crew_role
    end
  end
end
