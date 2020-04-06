class Event < ApplicationRecord
    has_many :event_addresses, inverse_of: :address
    has_many :addresses, through: :event_addresses 
    belongs_to :user
    # accepts_nested_attributes_for :event_addresses
    
   
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
      
      def full_address
        self.street + " " + self.city + " " + self.state + " " + self.country
      end
      


end

