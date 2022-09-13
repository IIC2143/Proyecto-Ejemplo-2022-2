require 'rails_helper'

RSpec.describe Game, type: :model do
  describe '#factory' do
    it 'is valid' do
      expect(build(:game)).to be_valid
    end
  end
end
