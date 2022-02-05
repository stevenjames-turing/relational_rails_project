class TeamsController < ApplicationController
  def index
    @teams = Team.order(created_at: :desc)
  end

  def show
    @team = Team.find(params[:id])
  end
  
  def new 
  end
  
  def create 
    team = Team.create!({
      league: params[:league],
      coach: params[:coach],
      roster: params[:roster]
      })
      redirect_to "/teams"
    end
    
    def edit
      @team = Team.find(params[:id])
    end
    
    def update 
      team = Team.find(params[:id])
      team.update({
        league: params[:league],
        coach: params[:coach],
        roster: params[:roster]})
      redirect_to "/teams/#{team.id}"
  end
end