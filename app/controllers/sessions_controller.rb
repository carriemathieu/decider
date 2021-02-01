class SessionsController < ApplicationController

    # new session for existing user
    def new
    end

    # assigns/creates new session or redirects
    def create
        user = User.find_by(username: params[:username])
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
end