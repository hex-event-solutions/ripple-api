# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Category do
  subject { create :category }

  describe 'fields' do
    it { should validate_presence_of(:name) }

    it { should validate_length_of(:name).is_at_most(32) }

    describe 'validates uniqueness of fullname' do
      let(:category) { create(:category, parent: subject.parent) }

      it 'raises an error if not unique' do
        expect { category.save }.to raise_error(ActiveRecord::RecordInvalid)
      end
    end
  end

  describe 'associations' do
    it { should have_many(:asset_type_categories) }
    it { should have_many(:children) }
  end
end
