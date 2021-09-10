class RatingsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def create
        rating = Rating.create(rating_params)
        render json: rating, status: :created
    end

    def update
        rating = find_rating
        rating.update(rating_params)
        render json: rating
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
