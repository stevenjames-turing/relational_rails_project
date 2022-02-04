require 'rails_helper'

describe Player, type: :model do
  describe 'relationships' do
    it { should belong_to :team }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :injured }
    it { should validate_presence_of :number }
  end
end