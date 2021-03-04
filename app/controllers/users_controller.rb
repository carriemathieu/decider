class UsersController < ApplicationController

    def index
        @users = User.all
    end
    # create an account page
    def new
        @user = User.new
    end

    # creates new user or redirects
    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def show
        redirect_if_not_logged_in
        @user = User.find_by(id: params[:id])
        redirect_to '/' if !@user
    end

    private

    def user_params
        params.require(:user).permit(:firstname, :lastname, :email, :password)
    end
end
