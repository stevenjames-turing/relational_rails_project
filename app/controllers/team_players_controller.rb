class TeamPlayersController < ApplicationController
  def index
    @team = Team.find(params[:id])
    @team_players = Team.find(params[:id]).players
  end
end