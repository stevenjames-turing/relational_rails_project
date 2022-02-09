class TeamsController < ApplicationController
  def index
    @teams = Team.sort_by_created_at
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

  def destroy
    Team.destroy(params[:id])
    redirect_to "/teams"
  end
end