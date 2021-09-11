class DogSerializer < ActiveModel::Serializer
  attributes :id, :name, :image_url, :breed_id, :likes, :dislikes
end
