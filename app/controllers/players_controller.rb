class PlayersController < ApplicationController
  def index
    @players = Player.all.injured
  end

  def show
    @player = Player.find(params[:id])
  end

  def edit
    @player = Player.find(params[:id])
  end

  def update
    player = Player.find(params[:id])
    player.update(number: params[:number], name: params[:name], injured: params[:injured])
    redirect_to "/players/#{player.id}"
  end

  def destroy
    Player.destroy(params[:id])
    redirect_to "/players"
  end
end