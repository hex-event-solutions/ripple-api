# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RolePrivilege do
  let!(:role) { create :role }
  let!(:role_privilege) { create :role_privilege, role: role }

  describe 'fields' do
    it 'returns create from action' do
      expect(role_privilege.action).to eq 'create'
    end

    it 'returns asset from resource' do
      expect(role_privilege.resource).to eq 'asset'
    end
  end

  describe 'associations' do
    it 'returns role from role' do
      expect(role_privilege.role).to eq role
    end
  end
end
