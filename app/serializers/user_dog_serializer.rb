class UserDogSerializer < ActiveModel::Serializer
  attributes :id, :name, :liked_dogs
  has_many :dogs
end
