class HolesController < ApplicationController

    def index
        @holes = Hole.all 
    end

end