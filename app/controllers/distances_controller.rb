class DistancesController < ApplicationController

    def new
        @events = Event.all
    end

    def create
        @from = Event.find_by(id: params[:from])
        @to = Event.find_by(id: params[:to])
        if @from && @to
          flash[:message] =
              "The distance between #{@from.name} and #{@to.name} is #{@from.distance_from(@to.to_coordinates).round(2)} miles"
        end
        redirect_to new_distance_path
      end

end