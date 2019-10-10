class SessionsController < ApplicationController
    
    def new
        @user = User.new
    end 

    def create
        #byebug
        @user = User.find_by(name: params[:name])
        
        if @user && @user.authenticate(params[:password])
            login(@user)
            redirect_to user_path(@user)
        else
            render 'new'
        end     
    end

    def destroy
        session.delete :user_id
        redirect_to root_path
    end 

    private

    def user_params
        params.require(:user).permit(:name, :password)
    end 
end
