class EventsController < ApplicationController

    def new 
        @event = Event.new
    end

    def create
        @event = Event.create(event_params)
        redirect_to event_path(@event)
        #@event.addresses.build(category: @event.category)
        # ...
    end

    def show 
        @event = Event.find(params[:id])
    end
        
    private

    def event_params
        params.require(:event).permit(:name, :category, :description)
            # addresses_attributes: [
            #     :category,
            #     :street, 
            #     :city, 
            #     :state, 
            #     :country])
    end

end