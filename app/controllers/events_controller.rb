class EventsController < ApplicationController
    before_action :set_event!, only: [:show, :edit, :update, :destroy]

    def new 
        @event = Event.new
        # @address = Address.new
        # @event.addresses << @address
        @event.addresses.build 
    end

    def index 
        @events = Event.all
        #@address = @event.addresses
    end

    def create
        @event = Event.new(event_params)
        puts "first : #{@event.addresses}"
        # @address = Address.new
        # @event.addresses << @address 
        #@event.update(event_params)
        puts "event address    #{@event.addresses}"
        @event.user_id = current_user.id
        if @event.save
            redirect_to event_path(@event)
        else 
            puts "#{@event}"
            @event.errors.full_messages.each do |msg|
                puts "#{msg}"
            end
            raise params.inspect
        end
        #@event.addresses.build(category: @event.category)
        # ...
    end

    def show 
        #@event = Event.find_by_id(params[:id])
    end

    # def update
    #     #raise params.inspect <ActionController::Parameters {"_method"=>"patch", "authenticity_token"=>"fCC84W/k04lXRKglg94kTIKsyxMNTnzolNNavYQIe9X5bIpbA7xLcrt2gRvuqATMBJXjKX5UScmV9Om+l6HHzA==", "event"=>{"address"=>{"street"=>"35 Rock Ledge Road", "city"=>"Laporte", "country"=>"United States"}}, "commit"=>"Save Event[address]", "controller"=>"events", "action"=>"update", "id"=>"2"} permitted: false>
    #     #how to update address?
    #     @event = Event.find(params[:id])
        
    #     @event.update(event_params)

    #     redirect_to event_path(@event)
    # end


    def update
        #raise params.inspect  <ActionController::Parameters {"_method"=>"patch", "authenticity_token"=>"gZJ9GRBDdlwgervAfjdzcejJYjpkMNRcmzIFzdRFzFpwrIteKicCechRmDa69gTtpsumHHgtemxzC2rqbq+S1Q==", "event"=>{"address"=>{"street"=>"740 s columb", "city"=>"Phila", "state"=>"PA", "country"=>""}}, "commit"=>"Update Event", "controller"=>"events", "action"=>"update", "id"=>"7"} permitted: false>
        @event = Event.find(params[:id])
        if params[:address].present?  #if the update is in an address form, update / add address to event. if the address is already in the system, edit that address, else, build new one?
            if @event.find_address(params[:address][:street])
                @event.find_address(params[:address][:street]).update(params[:address])
            else 
                @event.addresses.build(params[:address])
            end
        elsif @event.update(params)  #else, update the event
           #@event.addresses.build(event_params[:addresses_attributes])
          redirect_to event_path(@event), :notice => "Update completed"
        else
          render 'edit'
        end
      end

    def edit 
        #@event = Event.find_by_id(params[:id])
        #@address = Event.addresses.first
        # how to update multiple addresses for event?
        
    end

    def destroy
        @event.destroy
        redirect_to root_path
    end
        
    private

    def event_params
        params.require(:event).permit(:name, :category, :description, :user_id, #address_id:[],
            addresses_attributes: [
                :street, 
                :city, 
                :state, 
                :country])
    end

    def set_event!
        @event = Event.find(params[:id])
    end

end