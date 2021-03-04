class SessionsController < ApplicationController

    # new session for existing user
    def new
    end

    # assigns/creates new session or redirects
    def create
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            flash[:message] = "Incorrect login info, please try again"
            redirect_to '/signin'
        end
    end

    # clears session for logout
    def destroy
        session.clear
        redirect_to root_path
    end

    def omniauth # creates a user via Google auth hash
        @user = User.find_or_create_by(email: auth["info"]["email"]) do |user|
            user.firstname = auth["info"]["first_name"]
            user.password = SecureRandom.hex
        end

        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(user)
        else
            redirect_to '/'
        end  
    end

    private

    def auth # requests the auth hash
        request.env['omniauth.auth']
    end
end