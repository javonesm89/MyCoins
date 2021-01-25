class UsersController < ApplicationController
    def index
    end

    def show
        @user = User.find_by(params[:id])
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            redirect_to root_path
        end
    end

    private

    def user_params
        params.require(:user).permit(:name,:email,:salary)
    end
end
