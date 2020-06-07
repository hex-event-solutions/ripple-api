# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Category do
  subject { create :category }

  describe 'fields' do
    it { should validate_presence_of(:name) }

    it { should validate_length_of(:name).is_at_most(32) }

    describe 'validates uniqueness of fullname' do
      describe 'in the same company' do
        let!(:category1) { create(:category, company: subject.company, name: 'Frog', parent: nil) }
        let!(:category2) { build(:category, company: subject.company, name: 'Frog', parent: nil) }

        it 'raises an error if not unique' do
          expect { category2.save! }.to raise_error(ActiveRecord::RecordInvalid)
        end
      end

      describe 'in different companies' do
        let!(:category1) { create(:category, name: 'Frog', parent: nil) }
        let!(:category2) { build(:category, name: 'Frog', parent: nil) }

        it 'does not raise an error with the same name' do
          expect { category2.save! }.not_to raise_error
        end
      end
    end
  end

  describe 'associations' do
    it { should have_many(:asset_type_categories) }
    it { should have_many(:children) }
  end
end
