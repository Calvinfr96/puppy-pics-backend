class BreedsController < ApplicationController
    def index

    end

    def show

    end

    def create

    end

    private

    def breed_params
        params.permit(:name)
    end
end
