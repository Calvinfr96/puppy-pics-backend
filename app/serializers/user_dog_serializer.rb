class UserDogSerializer < ActiveModel::Serializer
  attributes :id, :name, :liked_dogs
end
