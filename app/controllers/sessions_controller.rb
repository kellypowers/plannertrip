
class SessionsController < ApplicationController
    #skip_before_action :verified_user, only: [:new, :create]

  def new
  end

  def create # receives data submitted in login form, authenticates and logs in a valid user
    if auth
      @user = User.find_or_create_by(uid: auth['uid']) do |u|
        u.name = auth['info']['name']
        u.email = auth['info']['email']
        u.image = auth['info']['image']
      end
   
      session[:user_id] = @user.id
      
      render 'welcome/home'
      #@user = User.find_or_create_by_omniauth(auth_hash)
      #session[:user_id] = @user.id
      #redirect_to user_path(@user), flash[:message] = "You successfully logged in!" 
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



  def destroy
    session.clear
    redirect_to root_path
  end
  
    private 
    def auth
      request.env['omniauth.auth']
    end
  end