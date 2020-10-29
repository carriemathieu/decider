class SessionsController < ApplicationController

    # new session for existing user
    def new
    end

    # assigns/creates new session or redirects
    def create
        
    end

    def destroy
        session.clear
        redirect_to root_path
    end
end