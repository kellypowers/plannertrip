class SessionController < ApplicationController
    skip_before_action :verified_user, only: [:new, :create]

  def new
  end

  def create # receives data submitted in login form, authenticates and logs in a valid user
    if auth_hash = request.env["omniauth.auth"]
      @user = User.find_or_create_by_omniauth(auth_hash)
      session[:user_id] = @user.id
      redirect_to user_path(@user), flash[:message] = "You successfully logged in!" 
    else
      @user = User.find_by(username: params[:username])
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id # log in the user
        redirect_to user_path(@user), flash[:message] = "You successfully logged in! Welcome, #{@user.name}!"
      else # present login form so user can try logging in again
        flash[:message] = "Your login attempt was unsuccessful. Please enter a valid email and password combination."
        render :new
      end
    end
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
    session.clear
    redirect_to root_path
  end
  
    # def create
    #   # After entering a name and email value in the /auth/developer
    #   # path and submitting the form, you will see a pretty-print of
    #   # the authentication data object that comes from the "developer"
    #   # strategy. In production, we'll swap this strategy for something
    #   # like 'github' or 'facebook' or some other authentication broker
    #   pp request.env['omniauth.auth']
  
    #   # We're going to save the authentication information in the session
    #   # for demonstration purposes. We want to keep this data somewhere so that,
    #   # after redirect, we have access to the returned data
    #   session[:name] = request.env['omniauth.auth']['info']['name']
    #   session[:omniauth_data] = request.env['omniauth.auth']
    #   redirect_to root_path
    # end
  end