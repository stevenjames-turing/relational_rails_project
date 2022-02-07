class Team < ApplicationRecord
  has_many :players
  # validates :roster, :coach, :league, presence: true 

  def self.sort_by_created_at
    Team.order(created_at: :desc)
  end

  def number_of_players
    players.count
  end
end