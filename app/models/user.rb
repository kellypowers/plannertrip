class User < ApplicationRecord
    has_secure_password
    before_save { |user| user.email = email.downcase }
    validates :password, presence: true #,  confirmation: true
    #validates :password_confirm, confirmation: true
    validates :email, presence: true, uniqueness: true
    #validates :username, presence: true, uniqueness: true 
    validates :name, presence: true
    has_many :planners 
    has_many :user_events
    has_many :events, through: :user_events
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

