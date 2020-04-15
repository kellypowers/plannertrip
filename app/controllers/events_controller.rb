class EventsController < ApplicationController
    before_action :set_event!, only: [:show, :edit, :update, :destroy, :add]

    

    def new 
        @event = Event.new
        @event.users << current_user
    end

    def index 
        if params[:query]
            @events = Event.search_location(params[:query])
            @hash = Gmaps4rails.build_markers(@events) do |event, marker|
                marker.lat event.latitude
                marker.lng event.longitude
                marker.infowindow event.name
              end
            if @events.none?
                flash[:message] = "There are no events for this location yet"
            end
        else
            @userevents = current_user.events
            @events_added = current_user.added_events
        end
    end


    def create
        @event = current_user.events.build(event_params) #this adds 
        if @event.save
            flash[:message] = "Event created successfully!"
            redirect_to "/users/#{current_user.id}/events/#{@event.id}"
        else 
            flash[:message]= "unsuccessful"
            render "new"
            
            #raise params.inspect
        end
    end

    def show 
        #binding.pry
       # if current_user.added_events.include?(event_id: @event.id)
            @userevent = UserEvent.find_by(user_id: current_user.id, event_id: @event.id)
        #end
    end

   
    def add 
        if current_user.event_already_added?(@event) || @event.belongs_to_user(current_user)
            redirect_to user_event_path(current_user, @event)
        else 
            #could use build, but need to add the comment to the join table
            UserEvent.create(user_id: current_user.id, event_id: @event.id, comment: params[:comment])
            redirect_to "/users/#{@user.id}/events/#{@event.id}"
        end
    end



    def update
        if @event.user == current_user
                if @event.update(event_params)  
                    flash[:message] = "Update Completed"
                    redirect_to event_path(@event)
                else 
                    flash[:message] = "Unable to update"
                    redirect_to event_path(@event)
                end
        else
            flash[:message] = "You can only update events you created."
            render 'show'
        end
      end



    def edit 
    end

    def destroy
        @event.destroy
        redirect_to root_path
    end
        
    private

    def event_params
        params.require(:event).permit(:name, :category, :comment, :street, :city, :state, :country, feedbacks_attributes: [:content, :rating])
    end

    def set_event!
        @event = Event.find(params[:id])
    end

end