# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Breed.destroy_all
Dog.destroy_all
User.destroy_all
Rating.destroy_all

puts 'Seeding Breeds'

breed_names = ["affenpinscher", "beagle", "chihuahua", "doberman", "greyhound"]
breed_names.each do |breed|
    Breed.create(name: breed)
end

puts "Seeding Dogs"

dog_names = ["Ginger", "Patch", "Goomba", "Greta", "Rubin", "Bubbles", "Garfield", "Tank", "Rufus", "Pudding", "Stitch", "Nubby", "Zander", "Yogi", "Pluto", "Ruby", "Rambo", "Franklin", "Skittles", "Dyson", "Bailey"]
dog_breeds = Breed.all

# affenpinscher
affenpinscher = Breed.find_by(name: "affenpinscher")
Dog.create(name: dog_names.sample, image_url: "https://images.dog.ceo/breeds/affenpinscher/n02110627_11279.jpg", breed: affenpinscher)
Dog.create(name: dog_names.sample, image_url: "https://images.dog.ceo/breeds/affenpinscher/n02110627_11365.jpg", breed: affenpinscher)
Dog.create(name: dog_names.sample, image_url: "https://images.dog.ceo/breeds/affenpinscher/n02110627_11614.jpg", breed: affenpinscher)
Dog.create(name: dog_names.sample, image_url: "https://images.dog.ceo/breeds/affenpinscher/n02110627_12003.jpg", breed: affenpinscher)
Dog.create(name: dog_names.sample, image_url: "https://images.dog.ceo/breeds/affenpinscher/n02110627_12431.jpg", breed: affenpinscher)

# beagle
beagle = Breed.find_by(name: "beagle")
Dog.create(name: dog_names.sample, image_url: "https://images.dog.ceo/breeds/beagle/n02088364_16210.jpg", breed: beagle)
Dog.create(name: dog_names.sample, image_url: "https://images.dog.ceo/breeds/beagle/n02088364_16588.jpg", breed: beagle)
Dog.create(name: dog_names.sample, image_url: "https://images.dog.ceo/breeds/beagle/n02088364_17294.jpg", breed: beagle)
Dog.create(name: dog_names.sample, image_url: "https://images.dog.ceo/breeds/beagle/n02088364_17935.jpg", breed: beagle)
Dog.create(name: dog_names.sample, image_url: "https://images.dog.ceo/breeds/beagle/n02088364_4493.jpg", breed: beagle)

# chihuahua
chihuahua = Breed.find_by(name: "chihuahua")
Dog.create(name: dog_names.sample, image_url: "https://images.dog.ceo/breeds/chihuahua/n02085620_11258.jpg", breed: chihuahua)
Dog.create(name: dog_names.sample, image_url: "https://images.dog.ceo/breeds/chihuahua/n02085620_1205.jpg", breed: chihuahua)
Dog.create(name: dog_names.sample, image_url: "https://images.dog.ceo/breeds/chihuahua/n02085620_13964.jpg", breed: chihuahua)
Dog.create(name: dog_names.sample, image_url: "https://images.dog.ceo/breeds/chihuahua/n02085620_1862.jpg", breed: chihuahua)
Dog.create(name: dog_names.sample, image_url: "https://images.dog.ceo/breeds/chihuahua/n02085620_3033.jpg", breed: chihuahua)

# doberman
doberman = Breed.find_by(name: "doberman")
Dog.create(name: dog_names.sample, image_url: "https://images.dog.ceo/breeds/doberman/n02107142_5517.jpg", breed: doberman)
Dog.create(name: dog_names.sample, image_url: "https://images.dog.ceo/breeds/doberman/n02107142_7102.jpg", breed: doberman)
Dog.create(name: dog_names.sample, image_url: "https://images.dog.ceo/breeds/doberman/n02107142_7731.jpg", breed: doberman)
Dog.create(name: dog_names.sample, image_url: "https://images.dog.ceo/breeds/doberman/n02107142_8399.jpg", breed: doberman)
Dog.create(name: dog_names.sample, image_url: "https://images.dog.ceo/breeds/doberman/n02107142_9772.jpg", breed: doberman)

# greyhound
greyhound = Breed.find_by(name: "greyhound")
Dog.create(name: dog_names.sample, image_url: "https://images.dog.ceo/breeds/greyhound-italian/n02091032_1034.jpg", breed: greyhound)
Dog.create(name: dog_names.sample, image_url: "https://images.dog.ceo/breeds/greyhound-italian/n02091032_10507.jpg", breed: greyhound)
Dog.create(name: dog_names.sample, image_url: "https://images.dog.ceo/breeds/greyhound-italian/n02091032_11626.jpg", breed: greyhound)
Dog.create(name: dog_names.sample, image_url: "https://images.dog.ceo/breeds/greyhound-italian/n02091032_1518.jpg", breed: greyhound)
Dog.create(name: dog_names.sample, image_url: "https://images.dog.ceo/breeds/greyhound-italian/n02091032_3763.jpg", breed: greyhound)

puts "Seeding Users"
user_names = ["Silvia", "Adam", "Yair", "Regina", "Aleski"]
user_names.each do |user|
    User.create(name: user)
end

puts "Seeding Ratings"
dogs = Dog.all
users = User.all
ratings = [true, false]
100.times do
    Rating.create(user: users.sample, dog: dogs.sample, good_boy?: ratings.sample)
end

puts "Seeding Complete"