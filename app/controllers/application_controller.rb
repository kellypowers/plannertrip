class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :verified_user
    helper_method :current_user, :logged_in?


    private 

    def verified_user
        if !logged_in?
            redirect_to login_path 
        end
    end

    def current_user
        @user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !!current_user
    end
end
