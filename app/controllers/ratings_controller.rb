class RatingsController < ApplicationController
    def create

    end

    def update

    end

    def rating_params
        params.permit(:good_boy?)
    end
end
