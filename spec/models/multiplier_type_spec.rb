# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MultiplierType do
  subject { build :multiplier_type }

  describe 'fields' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:multiplier) }
    it { should validate_presence_of(:multiplier_type) }
    it { should validate_presence_of(:operand_type) }
    it { should validate_presence_of(:operand_quantity) }

    it { should validate_length_of(:name).is_at_most(32) }
    it { should validate_inclusion_of(:multiplier_type).in_array(%w[hour day week month year]) }
    it { should validate_inclusion_of(:operand_type).in_array(%w[hour day week month year]) }

    it { should validate_numericality_of(:multiplier) }
    it { should validate_numericality_of(:operand_quantity) }
  end

  describe 'associations' do
    it { should have_many(:asset_type_multiplier_types) }
  end
end
