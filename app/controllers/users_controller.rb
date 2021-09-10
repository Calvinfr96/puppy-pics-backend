class UsersController < ApplicationController
    def index

    end

    def show

    end

    def create

    end

    def destroy

    end

    private
    
    def user_params
        params.permit(:name)
    end
end
