# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Contact do
  subject { build :contact }

  describe 'fields' do
    it { should validate_presence_of(:client) }
    it { should validate_presence_of(:name) }

    it { should validate_length_of(:name).is_at_most(64) }
    it { should validate_length_of(:email).is_at_most(255) }
    it { should validate_length_of(:phone).is_at_most(16) }
  end

  describe 'associations' do
    it { should belong_to(:client) }
  end
end
