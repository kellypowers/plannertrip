class EventsController < ApplicationController

    def create
        @event = Event.new(event_params)
        @event.event_addresses.build(category: @event.category).build_address
        # ...
        end
        
    private

    def person_params
        params.require(:event).permit(:name, :category, :description, :already_visited, 
            addresses_attributes: [
                :name, 
                :street, 
                :city, 
                :state, 
                :country])
    end

end