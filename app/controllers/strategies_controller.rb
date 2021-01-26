class StrategiesController < ApplicationController
    
    def show
        if session[:user_id] && @user = User.find_by(:id => params[:user_id])
            @strategy = @user.strategies.find_by(:id => params[:id])
        else
            flash[:error] = "STRATEGIES CAN ONLY BE VIEWED BY THEIR CREATOR"
            redirect_to root_path
        end
    end
    
    def new
        # binding.pry
        if session[:user_id] && @user = User.find_by(:id => params[:user_id])
            @strategy = @user.strategies.build
            @actions = Action.all
        else 
            flash[:alert] = "Must be a user"
            redirect_to root_path
        end
    end

    def create
        if @user = User.find_by(:id => strategies_params[:user_id])
            @strategy = @user.strategies.build(strategies_params)
            if @strategy.save
                redirect_to user_path(@user)
            else 
                redirect_to root_path
            end
        end 
    end

    private

    def strategies_params
        params.require(:strategy).permit(:goal,:path,:amount,:user_id,:action_id)
    end
end
