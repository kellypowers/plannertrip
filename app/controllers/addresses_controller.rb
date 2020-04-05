class AddressesController < ApplicationController


    def new
        #raise params.inspect
        @event = Event.find_by_id(:event_id)
        # @address = @event.addresses.build(post_params)
         #@address.event_addresses.build(event_id: params[:event_id], address_id: @address.id)
        @address = Address.new
    end

    def create
        # @address=Address.create(address_params)
        # @address.event_addresses.build(event_id: params[:event_id], address_id: @address.id)
        @event = Event.find(params[:id])
        @address = @event.addresses.build(post_params)
        @address.event_addresses.build(event_id: params[:event_id], address_id: @address.id)
        redirect_to event_path(@event)
        
    end

    def show 
        @address = Address.find(params[:id])
    end

    private

    def address_params
        params.require(:address).permit(
                :street, 
                :city, 
                :state, 
                :country)
    end



end
