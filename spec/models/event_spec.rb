# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Event do
  subject { create :event }

  describe 'fields' do
    it { should validate_presence_of(:client) }
    it { should validate_presence_of(:date_start) }
    it { should validate_presence_of(:date_end) }
    it { should validate_presence_of(:date_out) }
    it { should validate_presence_of(:date_return) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:location) }
  end

  describe 'associations' do
    it { should have_many(:shifts) }

    it { should belong_to(:client) }
  end
end
