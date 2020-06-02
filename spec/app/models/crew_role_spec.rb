# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CrewRole do
  let!(:crew) { create :crew }
  let!(:role) { create :role }
  let!(:crew_role) { create(:crew_role, crew: crew, role: role) }

  describe 'crew roles' do
    it 'includes the role from the crew' do
      expect(crew.roles).to include role
    end
  end

  describe 'role crew' do
    it 'includes the crew from the role' do
      expect(role.crew).to include crew
    end
  end
end
