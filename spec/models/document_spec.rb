# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Document do
  subject { build :document }

  describe 'fields' do
    it { should validate_presence_of(:company) }
    it { should validate_presence_of(:document_type) }
  end

  describe 'associations' do
    it { should belong_to(:company) }
    it { should belong_to(:document_type) }
  end
end
