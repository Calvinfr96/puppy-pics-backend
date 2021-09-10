class UsersController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def index
        users = User.all
        render json: users
    end

    def create
        user = User.create(user_params)
        render json: user, status: :created
    end

    def show
        user = find_user
        render json: user
    end

    def destroy
        user = find_user
        user.destroy
        head :no_content
    end

    private
    
    def user_params
        params.permit(:name)
    end

    def render_not_found_response
        render json: {error: "User not found"}, status: :not_found
    end

    def find_user
        User.find(params[:id])
    end
end
