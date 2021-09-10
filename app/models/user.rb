class User < ApplicationRecord
    has_many :ratings
    has_many :dogs, through: :ratings
end
