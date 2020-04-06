class WelcomeController < ApplicationController
  #skip_before_action :verified_user
    def home
      if logged_in?
        redirect_to user_path(current_user)
      else
        render 'home'
      end
    end
  end