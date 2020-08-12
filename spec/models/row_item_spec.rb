# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RowItem do
  subject { build :row_item }

  describe 'fields' do
    it { should validate_presence_of(:price) }
    it { should validate_presence_of(:description) }

    it { should validate_numericality_of(:price) }

    it { should validate_length_of(:description).is_at_most(255) }
  end

  # describe 'associations' do
  #   it { should have_many(:documents) }
  #   it { should have_many(:events) }
  # end
end
