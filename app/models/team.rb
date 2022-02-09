class Team < ApplicationRecord
  has_many :players, dependent: :delete_all
  validates_presence_of :roster, :league
  validates_inclusion_of :coach, in: [true, false]

  def self.sort_by_created_at
    Team.order(created_at: :desc)
  end

  def number_of_players
    players.count
  end

  def self.order_by(players, function)
    players.order(function)
  end
end