class ActionsController < ApplicationController
    def show
        @action = Action.find_by(:id => params[:id])
    end
end
