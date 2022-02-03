class HockeyBagsController < ApplicationController
  def index
    @hockey_bags = HockeyBag.all
  end

  def show
    @hockey_bag = HockeyBag.find(params[:id])
  end
end