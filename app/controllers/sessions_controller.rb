class SessionsController < ApplicationController
    def create
        if User.exists?(:email => params[:email]) && user = User.find_by(:email => params[:email])
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            flash[:alert] = "Unable to find user"
            redirect_to login_path
        end
    end

    def destroy
        redirect_to root_path if session.clear
    end
end
