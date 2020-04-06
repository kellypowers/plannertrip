class AddressesController < ApplicationController


    def new
        #raise params.inspect
        @event = Event.find_by_id(params[:event_id])
        # @address = @event.addresses.build(post_params)
        @address = Address.new
         @event.addresses << @address
        #@address = Address.new
        
    end

    def create
        # @address=Address.create(address_params)
        # @address.event_addresses.build(event_id: params[:event_id], address_id: @address.id)
        @event = Event.find_by_id(params[:event_id])
        @address = @event.addresses.build(address_params)
        #@address.event_addresses.build(event_id: params[:event_id], address_id: @address.id)
        redirect_to event_path(@event)
        
    end

    def show 
        @address = Address.find(params[:id])
    end

    def destroy
        Address.find(params[:id]).destroy
        redirect_to root_path
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
