class HockeyBagsController < ApplicationController
  def index
    @hockey_bags = HockeyBag.all
  end
end