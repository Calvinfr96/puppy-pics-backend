class DogsController < ApplicationController
    def index
        dogs = Dog.all
        render json: dogs
    end

    def create
        dog = Dog.create(dog_params)
        render json: dog, status: :created
    end

    private

    def dog_params
        params.permit(:name, :image_url)
    end
end
