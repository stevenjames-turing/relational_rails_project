class TeamsController < ApplicationController
  def index
    @teams = Team.order(league: :desc)
  end

  def show
    @team = Team.find(params[:id])
  end
end