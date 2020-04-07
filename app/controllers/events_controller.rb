class EventsController < ApplicationController
    before_action :set_event!, only: [:show, :edit, :update, :destroy]

    def new 
        @event = Event.new
    end

    def index 
        @events = Event.all
    end

    def create
        @event = Event.new(event_params)
        #@event.user_id = current_user.id
        if @event.save
            redirect_to event_path(@event)
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


    def update
        if @event.update(event_params)  
          redirect_to event_path(@event), :notice => "Update completed"
        else
          render 'edit'
        end
      end

    def edit 
        #@user = current_user
    end

    def destroy
        @event.destroy
        redirect_to root_path
    end
        
    private

    def event_params
        params.require(:event).permit(:name, :category, :description, #:user_ids, #do i want userid? 
                :street, 
                :city, 
                :state, 
                :country,
                :start_date_time,
                :end_date_time)
    end

    def set_event!
        @event = Event.find(params[:id])
    end

end