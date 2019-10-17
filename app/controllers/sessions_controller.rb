class SessionsController < ApplicationController
    
    def new
    end 

    def create
        @user = User.find_by(name: params[:name])
        
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            #byebug
            redirect_to user_path(@user)
        else
            flash[:danger] = "Improper login information entered."
            render 'new'
        end     
    end

    def destroy
        session.clear
        redirect_to '/'
    end 
end
