class Team < ApplicationRecord
  has_many :players
  # validates :roster, :coach, :league, presence: true 
end