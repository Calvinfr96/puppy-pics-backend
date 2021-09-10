class RatingsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def create

    end

    def update

    end

    private

    def rating_params
        params.permit(:good_boy?)
    end

    def render_not_found_response
        render json: {error: "Rating not found"}, status: :not_found
    end

    def find_rating
        Rating.find(params[:id])
    end
end
