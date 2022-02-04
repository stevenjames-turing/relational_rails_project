require 'rails_helper'

describe Hole, type: :model do
  describe 'relationships' do
    it { should belong_to :golf_course }
  end

  # describe 'validations' do
  #   it { should validate_presence_of :name }
  #   it { should validate_presence_of :par }
  #   it { should validate_presence_of :hazard }
  # end
end