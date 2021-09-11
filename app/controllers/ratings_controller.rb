class RatingsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    def create
        rating = Rating.create!(rating_params)
        render json: rating, status: :created
    end

    def update
        rating = find_rating
        rating.update!(rating_params)
        render json: rating
    end

    private

    def rating_params
        params.permit(:user_id, :dog_id, :good_boy?)
    end

    def render_not_found_response
        render json: {error: "Rating not found"}, status: :not_found
    end

    def render_unprocessable_entity_response(invalid)
        render json: {errors: invalid.record.errors}, status: :unprocessable_entity
    end

    def find_rating
        Rating.find(params[:id])
    end
end
