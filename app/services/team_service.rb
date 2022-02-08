class TeamService
  def self.team_players(players, function)
    if function
      Team.order_by(players, function.to_sym)
    else
      players
    end
  end
end
