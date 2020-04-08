class EventsController < ApplicationController
    before_action :set_event!, only: [:show, :edit, :update, :destroy]

    def new 
        @event = Event.new
        @event.users << current_user
    end

    def index 
        if params[:query]
            #use a scope method to get events that match the query (in the Event model)
            @events = Event.all
        else
            @events = current_user.added_events
        end
    end

    def create
        @event = current_user.events.build(event_params)
        #need different method for when user creates the event? right now any events seeded are aautomatically linked to user
        UserEvent.create(comment: event_params[:comment])
        #@event.users << current_user 
        #UserEvent.last.comment = event_params[:comment]
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
    end

    #why does seeding events automatically make it part of user events????
    def add 
        @event = Event.find_by(params[:id])
        if current_user.events.include?(@event)
            redirect_to user_event_path(current_user, @event)
        else 
            UserEvent.create(user_id: current_user.id, event_id: @event.id, comment: params[:comment])
            redirect_to user_event_path(current_user, @event)
        end
    end



    def update
        if @event.update(event_params)  
          redirect_to event_path(@event), :notice => "Update completed"
        else
          render 'edit'
        end
      end

      #who do i want to be able to edit events? events can be added and seen by everyone... they don't belong to anyone.. 
    def edit 
    end

    def destroy
        @event.destroy
        redirect_to root_path
    end
        
    private

    def event_params
        params.require(:event).permit(:name, :category, :comment, #:author_id, #:user_ids, #do i want userid? 
                :street, 
                :city, 
                :state, 
                :country)
    end

    def set_event!
        @event = Event.find(params[:id])
    end

end