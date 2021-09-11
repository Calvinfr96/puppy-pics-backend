class Rating < ApplicationRecord
    belongs_to :dog
    belongs_to :user
    validates_uniqueness_of :user, scope: :dog, message: "User cannot like dog twice"
end
