class UsersController < ApplicationController
    def index
    end

    def new
        @user = User.new
    end

    def create
        binding.pry
    end

    private

    def user_params
        params.require(:user).permit(:name,:email,:salary)
    end
end
