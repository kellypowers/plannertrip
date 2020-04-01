class Location < ApplicationRecord
    has_many :addresses 
    has_many :users
    has_many :categories, through: :events
    has_many :wishists, through: :users
    has_many :logged_visits, through: :users
    has_many :vaca_planners, through: :users
    accepts_nested_attributes_for :addresses 


    # after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }
    # geocoded_by :full_address
    # reverse_geocoded_by :latitude, :longitude, :address => :full_address
    # after_validation :reverse_geocode


    # reverse_geocoded_by :latitude, :longitude do |obj, results|
    #     if geo = results.first
    #       obj.city    = geo.city
    #       obj.zipcode = geo.postal_code
    #       obj.country = geo.country_code
    #     end
    #   end



    # def full_address
    #     [country, city, street].compact.join(‘, ‘)
    # end
end

