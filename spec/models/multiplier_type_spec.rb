# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MultiplierType do
  subject { create :multiplier_type }

  describe 'fields' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:multiplier) }
    it { should validate_presence_of(:operand_type) }
    it { should validate_presence_of(:operand_quantity) }

    it { should validate_length_of(:name).is_at_most(16) }
    it { should validate_length_of(:operand_type).is_at_most(8) }

    it { should validate_numericality_of(:multiplier) }
    it { should validate_numericality_of(:operand_quantity) }
  end

  describe 'associations' do
    it { should have_many(:asset_types) }
  end
end
