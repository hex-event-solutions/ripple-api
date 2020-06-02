require "rails_helper"

RSpec.describe Role do
  let(:role) { create :role }

  describe 'fields' do
    it 'returns Admin from name' do
      expect(role.name).to eq 'Admin'
    end
  end
end
