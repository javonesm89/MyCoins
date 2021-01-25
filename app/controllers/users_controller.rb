class UsersController < ApplicationController
    def index
    end

    def show
        if session[:user_id] && @user = User.find_by(:id => session[:user_id])
            if params[:id] == @user.id
                @user
            end
        else
            redirect_to root_path if !@user
        end
    end

    def new
        @user = User.new
    end

    def create
        # binding.pry
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
        params.require(:user).permit(:name,:email,:salary,:password)
    end
end
