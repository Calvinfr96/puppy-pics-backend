class User < ApplicationRecord
    has_many :ratings
    has_many :dogs, through: :ratings
    validates :name, presence: true
    validates :name, uniqueness: true
end
