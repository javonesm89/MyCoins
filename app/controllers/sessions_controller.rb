class SessionsController < ApplicationController
    def create
        if User.exists(:email => params[:email]) && @user = User.find_by(:email => params[:email])
            @user
        else
            flash[alert] = "Unable to find user"

    end

    def destroy
        redirect_to root_path if session.clear
    end
end
