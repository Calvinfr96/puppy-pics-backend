class User < ApplicationRecord
    has_many :ratings, dependent: :destroy
    has_many :dogs, through: :ratings
    validates :name, presence: true
    validates :name, uniqueness: true

    def liked_dogs
        positive_ratings = ratings.select do |rating|
            rating.good_boy?
        end
        liked_dogs = positive_ratings.collect do |rating|
            rating.dog
        end
        liked_dogs
    end
end
