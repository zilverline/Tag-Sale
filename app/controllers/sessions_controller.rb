class SessionsController < ApplicationController
    
    def new
    end 

    def create
        if auth_hash = request.env['omniauth.auth']

            @user = User.find_or_create_by_omniauth(auth_hash)
            session[:user_id] = @user.id

            redirect_to user_path(@user.id)
            
        else
            @user = User.find_by(name: params[:name])

            if @user && @user.authenticate(params[:password])        
                session[:user_id] = @user.id
                
                redirect_to user_path(@user)
            else
                render 'new'
            end
        end     
    end
            
            

    # def facebookAuth
    #     @user = User.find_or_create_by(uid: auth['uid']) do |u|
    #         u.name = auth['info']['name']
    #         u.email = auth['info']['email']
    #     end
       
    #     session[:user_id] = @user.id
       
    #         render 'welcome/home'
    # end

    def destroy
        session.clear
        redirect_to '/'
    end 

end
