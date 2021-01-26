class ActionsController < ApplicationController
    def show
        if session[:user_id] && @user = User.find_by(:id => params[:id]) 
            @action = @user.actions.find_by(:id => params[:id])
        else
            @action = Action.find_by(:id => params[:id])
        end
    end
end
