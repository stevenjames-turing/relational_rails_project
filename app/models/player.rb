class Player < ApplicationRecord
  belongs_to :team
  # validates :name, :injured, :number, presence: true 
  def self.injured
    Player.all.where(injured: true)
  end
end