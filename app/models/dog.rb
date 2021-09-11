class Dog < ApplicationRecord
    belongs_to :breed
    has_many :ratings
    validates :name, presence: true
    validates :breed_id, presence: true
    validates :image_url, presence: true, uniqueness: true

    def likes
        liked_dogs = ratings.select do |rating|
            rating.good_boy?
        end
        liked_dogs.length
    end

    def dislikes
        disliked_dogs = ratings.select do |rating|
            !rating.good_boy?
        end
        disliked_dogs.length
    end
end
