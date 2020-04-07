class PlannersController < ApplicationController 

    def new 
        @planner = Planner.new
    end

    def create
        @planner = Planner.new(name: params[:name], user_id: current_user.id)
    end



    
end