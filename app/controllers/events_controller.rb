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
        #if updating by adding comment:
        if params[:event][:feedback]
            #if comment already exists, edit it.
            if @comment = Feedback.find_by(user_id: current_user.id, event_id: @event.id)
                @comment.content = params[:event][:feedback][:content]
                @comment.rating = params[:event][:feedback][:rating]
                @comment.save
                flash[:message] = "Comment updated"
                redirect_to event_path(@event)
            else
                #else, add new comment
                @comment = Feedback.new(user_id: current_user.id, event_id: @event.id, content: params[:event][:feedback][:content], rating: params[:event][:feedback][:rating])
                if @comment.save
                    flash[:message] = "Comment added"
                    redirect_to event_path(@event)
                else
                    flash[:message] = "Unsuccessful"
                    redirect_to event_path(@event)
                end
            end 
        #if the current user is the one who created the event, can update the event info.
        elsif @event.user == current_user
                @event.update(event_params)  
                redirect_to event_path(@event), :notice => "Update completed"
        else
            flash[:message] = "You can only update events you created."
          render 'show'
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
        params.require(:event).permit(:name, :category, :comment, :street, :city, :state, :country, feedbacks_attributes: [:content, :rating])
    end

    def set_event!
        @event = Event.find(params[:id])
    end

end