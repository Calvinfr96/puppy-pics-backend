class RatingsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    def index
        users = Rating.all
        render json: users
    end

    def rate_dog
        exact_rating = Rating.find_by(user_id: rating_params[:user_id], dog_id: rating_params[:dog_id])
        if exact_rating && exact_rating[:good_boy?] == rating_params[:good_boy?]
            exact_rating.destroy
            head :no_content
        elsif exact_rating
            exact_rating.update!(rating_params)
            render json: exact_rating
        else
            rating = Rating.create!(rating_params)
            render json: rating, status: :created
        end
    end

    private

    def rating_params
        params.require(:rating).permit(:user_id, :dog_id, :good_boy?)
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
