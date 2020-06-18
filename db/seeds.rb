# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# borrar los datos
require "open-uri"

Ship.destroy_all
User.destroy_all

user1 = User.create!(email: "benjaistheman@gmail.com", password: "12345678")

photos = [
	"https://i.ytimg.com/vi/ca-ughZdtnc/maxresdefault.jpg",
	"https://www.forensisgroup.com/wp-content/uploads/2015/04/Cruise-Ship.jpg",
	"https://www.costacruise.com/B2C/ResourcesWebRevise/ships/subhome/mediterranea.jpg",
	"https://www.cottonboats.com/wp-content/uploads/cotton-boats_photos_05.jpg",
	"https://www.sailfishboats.com/wp-content/uploads/2018/01/documentation-photo-568x448.jpg",
	"https://contenderboats.com/wp-content/uploads/IMG_1043.jpeg",
	"https://i.ytimg.com/vi/tciIScdB9ok/maxresdefault.jpg",
	"https://xclusiveyachts.com/photo/yachts/26/2.jpg"
]

20.times do
	ship = Ship.create!(
		name: Faker::Name.unique.name,
		capacity: Faker::Vehicle.engine_size,
		description: Faker::Vehicle.standard_specs,
		destination: Faker::Address.city,
		user: user1,
		location: Faker::Address.city
		)
		
	file = URI.open(photos.sample)
	ship.photo.attach(io: file, filename: 'nes.png')
end
