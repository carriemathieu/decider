class SessionsController < ApplicationController

    def home
        if logged_in?
            redirect_to user_path(current_user)
        end
    end

    # new session for existing user
    def new
    end

    # assigns/creates new session or redirects
    def create
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            flash[:notice] = "Welcome, #{user.firstname}"
            redirect_to user_path(user)
        else
            flash[:alert] = "Incorrect login info, please try again"
            redirect_to '/signin'
        end
    end

    # clears session for logout
    def destroy
        session.clear
        redirect_to root_path
    end

    def omniauth # creates a user via Google auth hash
        @user = User.from_omniauth(auth)
        @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user)     
    end

    private

    def auth # requests the auth hash
        request.env['omniauth.auth']
    end
end