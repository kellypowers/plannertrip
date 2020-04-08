class User < ApplicationRecord
    has_secure_password
    has_one :author_id
    before_save { |user| user.email = email.downcase }
    #validates :password_confirm, confirmation: true
    validates :email, presence: true, uniqueness: true
    #validates :username, presence: true, uniqueness: true 
    validates :name, presence: true
    has_many :planners 
    has_many :events
    has_many :user_events
    has_many :added_events, through: :user_events, source: "event"
    # has_many :ratings, through: :events
    #has_many :events, through: :ratings
    has_many :ratings 
    #has_many :events, through: :planners #i dont know


    # def self.find_or_create_by_omniauth(auth_hash)
    #     self.where(provider: auth_hash["provider"], uid: auth_hash["uid"]).first_or_create do |user|
    #       user.name = auth_hash["info"]["name"] 
    #       user.email = auth_hash["info"]["email"] 
    #       #user.password = SecureRandom.hex # a random, unique string
    #     end
    #   end


end

