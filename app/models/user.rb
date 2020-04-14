class User < ApplicationRecord
    has_secure_password
    before_save { |user| user.email = email.downcase }
    validates :email, presence: true, uniqueness: true
    validates :name, presence: true
    has_many :events
    has_many :user_events
    #this is an alias, to make user who created event different than user who adds events to their event
    has_many :added_events, through: :user_events, source: "event"
    has_many :feedbacks 



    def event_already_added?(event)
        #if self.added_events.present?
            if self.added_events.include?(event) 
                 true 
            else
                 false 
            end
        #else 
         #   false 
        #end
    end
end

