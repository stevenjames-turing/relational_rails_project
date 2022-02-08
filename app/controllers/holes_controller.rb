class HolesController < ApplicationController

    def index
        @holes = Hole.all.has_hazard
    end

    def show 
        @hole = Hole.find(params[:id])
    end
    
    def edit
        @hole = Hole.find(params[:id])
    end
    
    def update 
        hole = Hole.find(params[:id])
        hole.update({
            name: params[:name],
            hazard: params[:hazard],
            par: params[:par]})
        redirect_to "/holes/#{hole.id}"
    end

end