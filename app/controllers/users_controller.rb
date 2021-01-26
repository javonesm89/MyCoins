class UsersController < ApplicationController
    helper_method :current_user
    
    def index
    end

    def show
        current_user
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
            @errors = @user.errors.full_messages
            render :new
        end
    end

    private

    def current_user
        if session[:user_id] && @user = User.find_by(:id => params[:id])
            @actions = Action.all
        else 
            redirect_to root_path
        end
    end

    def user_params
        params.require(:user).permit(:name,:email,:salary,:password)
    end
end
