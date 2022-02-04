require 'rails_helper'

describe Team, type: :model do
  describe 'relationships' do
    it { should have_many :players }
  end

  describe 'validations' do
    # it { should validate_presence_of :roster }
    # it { should validate_presence_of :league }
    # it { should validate_presence_of :coach }
  end
end