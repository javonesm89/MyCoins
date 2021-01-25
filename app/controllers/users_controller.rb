class UsersController < ApplicationController
    def index
    end

    def show
        @user = User.find_by(:id => session[:user_id])
        redirect_to root_path if !@user
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
            render :new
        end
    end

    private

    def user_params
        params.require(:user).permit(:name,:email,:salary)
    end
end
