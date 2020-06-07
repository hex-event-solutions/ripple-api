# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DocumentType do
  subject { create :document_type }

  describe 'fields' do
    it { should validate_presence_of(:name) }

    it { should validate_length_of(:name).is_at_most(32) }

    it { should validate_uniqueness_of(:name).scoped_to(:company) }
  end

  describe 'associations' do
    it { should have_many(:documents) }
    it { should have_many(:document_type_fields) }
  end
end
