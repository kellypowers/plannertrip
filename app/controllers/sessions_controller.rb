class SessionsController < ApplicationController
    skip_before_action :verified_user, only: [:new, :create]

  def new
    @user = User.new
  end

#   def create
    
#     if @user = User.find_by(name: params[:user][:name])
#       session[:user_id] = @user.id
#       redirect_to user_path(@user)
#     else
#       render 'new'
#     end
#   end

  def destroy
    session.delete("user_id")
    redirect_to root_path
  end
  
    def create
      # After entering a name and email value in the /auth/developer
      # path and submitting the form, you will see a pretty-print of
      # the authentication data object that comes from the "developer"
      # strategy. In production, we'll swap this strategy for something
      # like 'github' or 'facebook' or some other authentication broker
      pp request.env['omniauth.auth']
  
      # We're going to save the authentication information in the session
      # for demonstration purposes. We want to keep this data somewhere so that,
      # after redirect, we have access to the returned data
      session[:name] = request.env['omniauth.auth']['info']['name']
      session[:omniauth_data] = request.env['omniauth.auth']
      redirect_to root_path
    end
  end