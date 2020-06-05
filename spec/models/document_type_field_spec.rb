# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DocumentTypeField do
  subject { create :document_type_field }

  describe 'fields' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:object) }
    it { should validate_presence_of(:property) }
    it { should validate_presence_of(:document_type) }

    it { should validate_length_of(:name).is_at_most(32) }
  end

  describe 'associations' do
    it { should belong_to(:document_type) }
  end
end
