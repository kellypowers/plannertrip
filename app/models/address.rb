class Address < ApplicationRecord
    has_many :event_addresses, inverse_of: :event
    has_many :events, through: :event_addresses
    geocoded_by :full_address
    after_validation :geocode, if: ->(obj){ obj.full_address.present?} #and obj.full_address_changed? }
    reverse_geocoded_by :latitude, :longitude
    after_validation :reverse_geocode
    
    # has_many :events 
    # accepts_nested_attributes_for :events

    def full_address 
        [self.street, self.city, self.state, self.country].compact.join(', ')
    end 

    def get_coordinates
        addr = self.full_address
        results = Geocoder.search(addr)
        #results.first.coordinates
        puts "RESULTS IS #{results}"
        results
        #results.coordinates
    end

    def geocode_address
        Geocoder.search(self.full_address)
    end
    


end

