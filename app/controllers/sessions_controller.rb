class SessionsController
    def create 
        @user = User.find_by(name: params(:name))
        return.authenticate(params[:password])
        session[:user_id] = @user.id
    end
end
