# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Specification do
  subject { create :specification }

  describe 'fields' do
    it { should validate_presence_of(:name) }

    it { should validate_length_of(:name).is_at_most(32) }

    it { should validate_uniqueness_of(:name) }
  end

  describe 'associations' do
    it { should have_many(:asset_type_specifications) }
  end
end
