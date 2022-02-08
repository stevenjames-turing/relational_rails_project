class TeamPlayersController < ApplicationController
  def index
    @team = Team.find(params[:id])
    player_records = Team.find(params[:id]).players
    @team_players = TeamService.team_players(player_records, params[:sort])
  end

  def new
    @team = Team.find(params[:id])
  end

  def create
    team = Team.find(params[:id])
    player = team.players.create!(name: params[:name], number: params[:number], injured: params[:injured])
    redirect_to "/teams/#{team.id}/players"
  end
end