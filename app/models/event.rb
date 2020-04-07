class Event < ApplicationRecord
    has_many :event_addresses, inverse_of: :address
    has_many :addresses, through: :event_addresses 
    belongs_to :user
    accepts_nested_attributes_for :addresses

    #prevents duplicates... does not work. : #<Address::ActiveRecord_Associations_CollectionProxy:0x00007f9d9ae081e0>
  #   def addresses_attributes=(address_attributes)
  #     address_attributes.values.each do |address_attribute|
  #     address = Address.find_or_create_by(address_attribute)
  #     self.addresses << address
  #   end
  # end

  def find_address(street_ad)
    self.addresses.each do |ad|
      if ad.street == street_ad
        return ad 
      else 
        false 
      end
    end
  end

  def list_addresses
    self.addresses.map{|i| i.full_address}
  end

  def geocoded_address 
    self.list_addresses.each do |i|
      Geocoder.search(i)
    end
  end



    
   
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

