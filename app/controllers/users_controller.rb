require 'pry'
class UsersController < ApplicationController
    skip_before_action :verified_user, only: [:new, :create]

    def home 
      #@events = Event.search(params[:query])
      render 'home'
    end
  
    def new
      @user = User.new
    end
  
    def create
      #raise params.inspect
      @user = User.new(user_params)
      #binding.pry 
      if @user.save 
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        #binding.pry
        flash[:message] = "Unable to create"
        render 'new'
      end
    end

  
    def show
      current_user
    end

    # def search  
    #   if params[:search].blank?  
    #     redirect_to(root_path, alert: "Empty field!")  
    #   else  
    #     @parameter = params[:search].downcase  
    #     @results = Location.all.where("lower(name) LIKE :search", search: @parameter)  
    #   end  
    # end
  

    def edit
    end

    def update 
      @user = current_user
      if @user.update(user_params)
        redirect_to user_path(@user)
      else 
        flash[:message] = "Unable to update. Please enter a valid password"
        redirect_to edit_user_path(@user)
      end
    end
  
    private
  
    def user_params
      params.require(:user).permit(:name, :password, :email)
    end
  end