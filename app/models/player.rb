class Player < ApplicationRecord
  belongs_to :team
  validates_presence_of :name, :number
  validates_inclusion_of :injured, in: [true, false]

  def self.injured
    Player.all.where(injured: true)
  end
end