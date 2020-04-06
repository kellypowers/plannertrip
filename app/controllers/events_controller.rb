class EventsController < ApplicationController

    def new 
        @event = Event.new
    end

    def create
        @event = Event.new(event_params)
        @event.user_id = current_user.id
        if @event.save
            #@event.user_id = current_user.id
            redirect_to event_path(@event)
        else 
            raise params.inspect
        end
        #@event.addresses.build(category: @event.category)
        # ...
    end

    def show 
        @event = Event.find(params[:id])
    end

    def update
        #raise params.inspect <ActionController::Parameters {"_method"=>"patch", "authenticity_token"=>"fCC84W/k04lXRKglg94kTIKsyxMNTnzolNNavYQIe9X5bIpbA7xLcrt2gRvuqATMBJXjKX5UScmV9Om+l6HHzA==", "event"=>{"address"=>{"street"=>"35 Rock Ledge Road", "city"=>"Laporte", "country"=>"United States"}}, "commit"=>"Save Event[address]", "controller"=>"events", "action"=>"update", "id"=>"2"} permitted: false>
        @event = Event.find(params[:id])
    end
        
    private

    def event_params
        params.require(:event).permit(:name, :category, :description, :user_id)
            # addresses_attributes: [
            #     :category,
            #     :street, 
            #     :city, 
            #     :state, 
            #     :country])
    end

end