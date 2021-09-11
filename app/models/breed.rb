class Breed < ApplicationRecord
    has_many :dogs, dependent: :destroy
    validates :name, presence: true
    validates :name, uniqueness: true
end
