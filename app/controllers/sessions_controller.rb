class SessionsController < ApplicationController
    
    def new
        @user = User.new
    end 

    def create
        #sets auth_hash to all of the users logged in info from facebook in this case.
        if auth_hash = request.env['omniauth.auth']

            @user = User.find_or_create_by_omniauth(auth_hash)
            session[:user_id] = @user.id

            redirect_to user_path(@user.id)
            
        else
            @user = User.find_by(name: params[:name])
        
            if @user && @user.authenticate(params[:password]) 
                
                session[:user_id] = @user.id

                flash[:notice] = "Successfully Logged in."
                
                redirect_to user_path(@user)
            else
                flash[:failure] = "Please enter valid credentials."
                render :new                
            end
        end     
    end

    def destroy
        session.clear
            flash[:notice] = "Successfully logged out!"
        redirect_to '/'
    end 

end
