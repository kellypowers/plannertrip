class AddressesController < ApplicationController

    def new
        @address = Address.new
    end

    def create
        @address=Address.create(address_params)
    end

    def show 
        @address = Address.find(params[:id])
    end

    private



end
