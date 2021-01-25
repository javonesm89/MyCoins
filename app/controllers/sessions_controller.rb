class SessionsController < ApplicationController
    def create
        
    end

    def destroy
        redirect_to root_path if session.clear
    end
end
