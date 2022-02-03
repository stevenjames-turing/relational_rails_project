class HolesController < ApplicationController

    def index
        @holes = Hole.all 
    end

    def show 
        @hole = Hole.find(params[:id])
    end

end