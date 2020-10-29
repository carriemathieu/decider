class UsersController < ApplicationController

    # create an account page
    def new
        @user = User.new
    end

    # creates new user or redirects
    def create
        @user = User.new(user_params)
        if @user.save
            binding.pry

            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def show
        @user = User.find_by(id: params[:id])
    end

    private

    def user_params
        params.require(:user).permit(:username, :password)
    end
end
