# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CrewRole do
  subject { create :crew_role }

  describe 'associations' do
    it { should belong_to(:crew) }
    it { should belong_to(:role) }
  end
end
