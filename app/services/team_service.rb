class TeamService
  def self.team_players(players, params)
    if params[:number] != nil
      reduced_data = players.where("number > #{params[:number].to_i}")
      Team.order_by(reduced_data, :number)
    elsif (params[:sort] == "name") || (params[:sort] == "number")
      Team.order_by(players, params[:sort])
    else
      players
    end
  end
end
