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
            {
                :id => rating.dog.id,
                :name => rating.dog.name,
                :image_url => rating.dog.image_url,
                :breed_id => rating.dog.breed_id,
                :likes => rating.dog.likes,
                :dislikes => rating.dog.dislikes
            }
        end
        liked_dogs
    end
end
