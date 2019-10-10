class UsersController < ApplicationController

    before_action :authenticate_user, only: [:show]

    def index 
        @users = User.all
    end
    def new 
        @user = User.new
    end

    def create 
        @user = User.new(user_params)
        if @user.save
            login(@user)
            redirect_to user_path(@user)
        else
            render 'new'
        end
    end

    def show 
        if logged_in?
            @user = User.find_by(id: session[:user_id])
        else 
            redirect_to root_path
        end
    end

    def edit 

    end

    def update

    end

    private 

    def user_params
        params.require(:user).permit(:name, :email, :password, :location)
    end
end
