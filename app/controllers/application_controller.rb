class ApplicationController < ActionController::Base
    # gives views access to helper methods
    helper_method :current_user, :logged_in?

    
    private 

    # if already defined, current_user = current_user. else, find current_user.
    def current_user
        @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    end

    # if session assigned user_id
    def logged_in?
        !!session[:user_id]
    end

    def redirect_if_not_logged_in
        redirect to '/' if !logged_in?
    end
end
