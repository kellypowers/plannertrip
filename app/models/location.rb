class Location < ApplicationRecord
    has_many :addresses 
    has_many :users
    has_many :categories, through: :events
    has_many :wishists, through: :users
    has_many :logged_visits, through: :users
    has_many :vaca_planners, through: :users
    accepts_nested_attributes_for :addresses 


end

