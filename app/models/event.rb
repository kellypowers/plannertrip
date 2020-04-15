class Event < ApplicationRecord
  #makes current user available to this model
   cattr_accessor :current_user
   has_many :user_events
   belongs_to :user
   has_many :users, through: :user_events
   #rails scope with arguments
   scope :search_location, -> (query) {where('CITY like ? ', "%#{query}%").or(where('STATE like ? ', "%#{query}%")).or(where('STATE like ? ', "%#{query}%")) }
  has_many :feedbacks
  accepts_nested_attributes_for :feedbacks, allow_destroy: true
  geocoded_by :full_address
  after_validation :geocode, if: ->(obj){ obj.full_address.present?} #and obj.full_address_changed? }
  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode
  validates :name, presence: true
  validates :city, presence: true
   

  

   def full_address 
       [self.street, self.city, self.state, self.country].compact.join(', ')
   end 


   def geocode_address
       Geocoder.search(self.full_address)
   end



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

  def average_rating
    sum = 0
    self.feedbacks.all.each do |feedback|
      sum += feedback.rating.to_i 
    end
    sum / (self.feedbacks.count)
  end
    

  def user_already_gave_feedback(current_user)
    self.feedbacks.find_by(event_id: self.id, user_id: current_user.id) ? true : false 
  end
      


end

