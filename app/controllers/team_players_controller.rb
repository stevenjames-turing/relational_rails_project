class TeamPlayersController < ApplicationController
  def index
    @team = Team.find(params[:id])
    @team_players = Team.find(params[:id]).players
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