require 'rails_helper'

describe GolfCourse, type: :model do
  describe 'relationships' do
    it { should have_many :holes }
  end

  describe 'validations' do
    it { should validate_presence_of :hole_count }
    it { should validate_presence_of :name }
    it { should validate_inclusion_of(:public).in?([true, false]) }
  end
end