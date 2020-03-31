class Event < ApplicationRecord
    has_many :addresses 
    has_many :users
    has_many :categories
    has_many :locations, through: :addresses 
    accepts_nested_attributes_for :addresses 


end

