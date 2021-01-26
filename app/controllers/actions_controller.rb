class ActionsController < ApplicationController
    def show
        if params[:user_id] && @user = User.find_by(:id => params[:user_id])
            if @user.actions.any?
                @action = @user.actions.find_by(:id => params[:id])
            else
                @action = Action.find_by(:id => params[:id])
            end
        end
    end
end
