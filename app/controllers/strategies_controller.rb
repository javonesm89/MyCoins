class StrategiesController < ApplicationController
    def new
        if session[:user_id] && user = User.find_by(:id => session[:user_id])
            @strategy = user.strategies.build
        end
    end

    def create
        binding.pry
    end
end
