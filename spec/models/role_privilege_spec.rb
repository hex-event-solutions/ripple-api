# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RolePrivilege do
  subject { create :role_privilege }

  describe 'fields' do
    it { should validate_presence_of(:role) }
    it { should validate_presence_of(:action) }
    it { should validate_presence_of(:resource) }
  end

  describe 'associations' do
    it { should belong_to(:role) }
  end
end
