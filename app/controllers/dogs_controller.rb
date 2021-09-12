class DogsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    
    def index
        dogs = Dog.all
        render json: dogs, methods: [:likes, :dislikes]
    end

    def create
        dog = Dog.create!(dog_params)
        render json: dog, status: :created
    end

    def destroy
        dog = find_dog
        dog.destroy
        head :no_content
    end

    private

    def dog_params
        params.permit(:name, :breed_id, :image_url)
    end

    def render_not_found_response
        render json: {error: "Dog not found"}, status: :not_found
    end

    def render_unprocessable_entity_response(invalid)
        render json: {errors: invalid.record.errors}, status: :unprocessable_entity
    end

    def find_dog
        Dog.find(params[:id])
    end
end
