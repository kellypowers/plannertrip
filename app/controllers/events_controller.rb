class EventsController < ApplicationController
    before_action :set_event!, only: [:show, :edit, :update, :destroy, :add]

    def new 
        @event = Event.new
        @event.users << current_user
    end

    def index 
        if params[:query]
            @events = Event.search_location(params[:query])
            #use a scope method to get events that match the query (in the Event model)
            #@events = Event.all
        else
            #binding.pry
            @userevents = current_user.events
            @events_added = current_user.added_events
        end
    end

    def create
        @event = current_user.events.build(event_params) #this adds 
        #@event = Event.new(event_params)
        #need different method for when user creates the event? right now any events seeded are aautomatically linked to user
        #UserEvent.create(comment: event_params[:comment]) #need to get this working, so the join table adds comment
        #@userevent = UserEvent.find_by(event_id: @event.id, user_id: current_user.id)
        #UserEvent.last.comment = event_params[:comment]
        #@userevent.comment = event_params[:comment]
        #@event.users << current_user 
        if @event.save
            redirect_to "/users/#{current_user.id}/events/#{@event.id}"
        else 
            puts "#{@event}"
            @event.errors.full_messages.each do |msg|
                puts "#{msg}"
            end
            raise params.inspect
        end
    end

    def show 
        #binding.pry
    end

    #this is not working correctly
    def add 
        #@event = Event.find_by_id(params[:id])
        #if event is alreadt added or event belongs to user, dont add, show the event
        #binding.pry
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
            @event.update(event_params)  
          redirect_to event_path(@event), :notice => "Update completed"
        else
            flash[:message] = "You can only update events you created."
          render 'edit'
        end
      end

      #who do i want to be able to edit events? events can be added and seen by everyone... they don't belong to anyone.. 
      #to edit events, check if user is the user who made it by @event.user

    def edit 

    end

    def destroy
        @event.destroy
        redirect_to root_path
    end
        
    private

    def event_params
        params.require(:event).permit(:name, :category, :comment, 
                :street, 
                :city, 
                :state, 
                :country)
    end

    def set_event!
        @event = Event.find(params[:id])
    end

end