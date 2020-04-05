require 'pry'
class UsersController < ApplicationController
    skip_before_action :verified_user, only: [:new, :create]
  
    def new
      @user = User.new
      #params.inspect
    end
  
    def create
      #raise params.inspect
      @user = User.new(user_params)
      #binding.pry 
      if @user.save 
        session[:user_id] = @user.id
        #redirect_to user_path(@user)
        redirect_to user_path(@user)
      else
        #binding.pry
        #flash[:message] = "did not work"
        render 'new'
      end
    end

  
    # def show
    #   @locations = Location.all
    # end

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
      @user = User.find(params[:id])
      @user.update(user_params[:name])
      redirect_to user_path(@user)
    end
  
    private
  
    def user_params
      params.require(:user).permit(:name, :password, :email)
    end
  end