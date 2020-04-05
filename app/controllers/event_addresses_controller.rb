 class EventAddressesController < ApplicationController 
    belongs_to :address
    belongs_to :event 
#     validates_presence_of :event 
#     validates_presence_of :address 
#     accepts_nested_attributes_for :address


    def new
        #raise params.inspect
        @event = Event.find_by_id(:event_id)
        # @address = @event.addresses.build(post_params)
        #@address.event_addresses.build(event_id: params[:event_id], address_id: @address.id)
        @address = Address.new
    end
end
