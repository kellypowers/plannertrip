class Address < ApplicationRecord
    has_many :event_addresses, inverse_of: :event
    has_many :events, through: :event_addresses
    # has_many :events 
    # accepts_nested_attributes_for :events
end

