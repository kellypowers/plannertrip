class EventsController < ApplicationController

    def new 
        @event = Event.new
    end

    def create
        @event = Event.create(event_params)
        @event.addresses.build(category: @event.category)
        # ...
    end
        
    private

    def event_params
        params.require(:event).permit(:name, :category, :description, :already_vistied, 
            addresses_attributes: [
                :category,
                :street, 
                :city, 
                :state, 
                :country])
    end

end