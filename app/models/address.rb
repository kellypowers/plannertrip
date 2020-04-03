class Address < ApplicationRecord
    has_many :event_addresses, inverse_of: :event
    has_many :events, through: :event_addresses
end

