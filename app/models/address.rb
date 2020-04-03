class Address < ApplicationRecord
    has_many :event_addresses 
    has_many :events, through: :event_addresses
end

