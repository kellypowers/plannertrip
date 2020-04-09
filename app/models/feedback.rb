class Feedback < ActiveRecord::Base
    belongs_to :user
    belongs_to :event
    validates :content, presence: true 
    validates :rating, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 10}

    def self.average_rating(event)
    end

  end