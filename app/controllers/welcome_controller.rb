class WelcomeController < ApplicationController
  #skip_before_action :verified_user
    def home
      if logged_in?
        render '/users/home'
      else
        render 'home'
      end
    end
  end