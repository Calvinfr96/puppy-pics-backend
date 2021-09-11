class BreedsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    
    def index
        breeds = Breed.all
        render json: breeds
    end

    def create
        breed = Breed.create!(breed_params)
        render json: breed, status: :created
    end

    def show
        breed = find_breed
        render json: breed, include: :dogs
    end

    private

    def breed_params
        params.permit(:name)
    end

    def render_not_found_response
        render json: {error: "Breed not found"}, status: :not_found
    end

    def render_unprocessable_entity_response(invalid)
        render json: {errors: invalid.record.errors}, status: :unprocessable_entity
    end

    def find_breed
        Breed.find(params[:id])
    end
end
