class DogsController < ApplicationController
    def index

    end

    def create

    end

    private

    def dog_params
        params.permit(:name, :image_url)
    end
end
