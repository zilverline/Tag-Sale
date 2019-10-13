class SessionsController < ApplicationController
    
    def new
    end 

    def create
        #byebug
        # if auth = request.env["omniauth.auth"]
        #     @user = User.find_or_create_by_omniauth(auth)
        #     session[:user_id] = @user.id
        #     redirect_to root_path
        # else
            @user = User.find_by(name: params[:name])
        
            if @user && @user.authenticate(params[:password])
                session[:user_id] = @user.id
                redirect_to user_path(@user)
            else
                render 'new'
            end  
        #end   
    end

    def destroy
        session.clear
        redirect_to '/'
    end 

    private

    # def user_params
    #     params.require(:user).permit(:name, :password)
    # end 
end
