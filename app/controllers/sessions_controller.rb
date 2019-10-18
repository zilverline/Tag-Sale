class SessionsController < ApplicationController
    
    def new
    end 

    def create
        if auth_hash = request.env['omniauth.auth']

            @user = User.find_or_create_by_omniauth(auth_hash)
            session[:user_id] = @user.id

            redirect_to root_path
            #byebug
        #login with omniauth
            # oauth_email = request.env['omniauth.auth'][:info]['email']
            # if User.find_by(:email => oauth_email)
            #     session[:user_id] = @user.id

            #     redirect_to root_path
            # else
            #     #first time on "our" site, uses email fr. FB and generated random pass. string
            #     @user = User.new(:email => oauth_email, :password => SecureRandom.hex)
            #     if @user.save

            #         session[:user_id] = @user.id
            
            #         redirect_to root_path
            #     else

            #     end
            # end
        else
            #normal login
            @user = User.find_by(name: params[:name])

            if @user && @user.authenticate(params[:password])
        
                session[:user_id] = @user.id
                #byebug
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
