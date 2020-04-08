class Event < ApplicationRecord
   cattr_accessor :current_user
   has_many :user_events
   belongs_to :user
   has_many :users, through: :user_events
   #rails scope with arguments
   scope :search_location, -> (query) {where('CITY like ? ', "%#{query}%").or(where('STATE like ? ', "%#{query}%")).or(where('STATE like ? ', "%#{query}%")) }
  #has_many :ratings 
  geocoded_by :full_address
  after_validation :geocode, if: ->(obj){ obj.full_address.present?} #and obj.full_address_changed? }
  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode
   

  

   def full_address 
       [self.street, self.city, self.state, self.country].compact.join(', ')
   end 

  #  def get_coordinates
  #      addr = self.full_address
  #      results = Geocoder.search(addr)
  #      #results.first.coordinates
  #      puts "RESULTS IS #{results}"
  #      results
  #      #results.coordinates
  #  end

   def geocode_address
       Geocoder.search(self.full_address)
   end

   #
  # def find_address(street_ad)
  #   self.each do |ad|
  #     if ad.street == street_ad
  #       return ad 
  #     else 
  #       false 
  #     end
  #   end
  # end

  def self.list_addresses
    Event.all.map{|i| i.full_address.downcase}
  end

  def geocoded_address 
    Event.list_addresses.each do |i|
      Geocoder.search(i)
    end
  end

  def belongs_to_user(current_user)
    self.user == current_user ? true : false 
  end


  # def already_added?
  #   if current_user.added_events.valid?
  #     current_user.added_events.include?(@event) ? true : false 
  #   else 
  #     false
  #   end
  # end

    
   
    # has_many :users
    # has_many :categories
    # has_many :locations, through: :addresses 
    # accepts_nested_attributes_for :addresses 
    # scope :logged, -> { where(already_visited: true)}
    # scope :wishlist, -> { where(already_visited: false)}

    # has_many :locatons
    # has_many :visited_locations, ->{ where(already_been: true )}, class_name:'Location'
    # has_many :wishlist_locations, ->{ where(already_been: false) }, class_name: 'Location'

    # has_many :planned_locations, ->{ where(already_been: false) }, class_name: 'Location'

        #conditional assiciations
    
      
      #User.find(1).visitd_locations
      


end

