class DogsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    
    def index
        dogs = Dog.all
        render json: dogs, methods: [:likes, :dislikes]
    end

    def create
        dog = Dog.create!(dog_params)
        render json: dog, status: :created
    end

    private

    def dog_params
        params.permit(:name, :image_url)
    end

    def render_unprocessable_entity_response(invalid)
        render json: {errors: invalid.record.errors}, status: :unprocessable_entity
    end
end
