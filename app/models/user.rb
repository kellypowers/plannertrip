class User < ApplicationRecord
    has_secure_password
    validates :password, presence: true #,  confirmation: true
    #validates :password_confirm, confirmation: true
    validates :email, presence: true, uniqueness: true 
    validates :username, presence: true, uniqueness: true 
    validates :name, presence: true



end

