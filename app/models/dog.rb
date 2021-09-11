class Dog < ApplicationRecord
    belongs_to :breed
    has_many :ratings
    validates :name, presence: true
end
