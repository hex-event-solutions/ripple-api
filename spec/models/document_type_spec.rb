# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DocumentType do
  subject { build :document_type }

  describe 'fields' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:content) }
    it { should validate_presence_of(:subject) }

    it { should validate_length_of(:name).is_at_most(32) }

    it { should validate_uniqueness_of(:name).scoped_to([:company_id, :subject]) }
  end

  describe 'associations' do
    it { should have_many(:documents) }
    it { should belong_to(:company) }
  end
end
