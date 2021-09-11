class BreedDogSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :dogs
end
