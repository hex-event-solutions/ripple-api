# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Role do
  subject { create :role }

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_most(32) }
    it { should validate_uniqueness_of(:name) }
  end

  describe 'associations' do
    it { should have_many(:crew_roles) }
    it { should have_many(:role_privileges) }
  end
end
