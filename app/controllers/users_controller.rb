class UsersController < ApplicationController
    skip_before_action :verified_user, only: [:new, :create]
  
    def new
      @user = User.new
    end
  
    def create
      @user = User.new(user_params)
      if @user.save 
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        render 'new'
      end
    end
    #   if (user = User.create(user_params))
    #     session[:user_id] = user.id
    #     redirect_to user_path(user)
    #   else
    #     render 'new'
    #   end
    # end
  
    def show
      @locations = Location.all
    end

    def search  
      if params[:search].blank?  
        redirect_to(root_path, alert: "Empty field!")  
      else  
        @parameter = params[:search].downcase  
        @results = Location.all.where("lower(name) LIKE :search", search: @parameter)  
      end  
    end
  

    def edit
      authorize @user 
    end
  
    private
  
    def user_params
      params.require(:user).permit(
        :name,
        :username,
        :password,
        :password_confirmation, 
        :email
      )
    end
  end