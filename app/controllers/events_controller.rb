class EventsController < ApplicationController

    def create
        @event = Event.new(event_params)
        # ...
        end
        
    private

    def person_params
        params.require(:event).permit(:name, :category, :description, :already_visited, addresses_attributes: [:id, :name, :street, :city, :state, :country])
    end

end