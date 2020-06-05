# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DocumentStateEvent do
  subject { create :document_state_event }

  describe 'fields' do
    it { should validate_presence_of(:document) }
    it { should validate_presence_of(:document_state) }
  end

  describe 'associations' do
    it { should belong_to(:document) }
    it { should belong_to(:document_state) }
  end
end
