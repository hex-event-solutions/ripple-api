# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DocumentItem do
  subject { create :document_item }

  describe 'fields' do
    it { should validate_presence_of(:item) }
    it { should validate_presence_of(:quantity) }
    it { should validate_presence_of(:discount) }

    it { should validate_numericality_of(:quantity) }
    it { should validate_numericality_of(:discount) }
  end

  describe 'associations' do
    it { should belong_to(:document) }
    it { should belong_to(:item) }
  end
end
