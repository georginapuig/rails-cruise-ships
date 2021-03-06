# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# borrar los datos
require "open-uri"
require "faker"

Booking.destroy_all
Ship.destroy_all
User.destroy_all

prices =[400, 450, 500, 550, 600, 700]

user1 = User.create!(email: "benjaistheman@gmail.com", password: "12345678")

photos = [
	"https://images.unsplash.com/photo-1574314970612-0d2762d7c7a8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80",
	"https://contenderboats.com/wp-content/uploads/IMG_1043.jpeg",
	"https://images.unsplash.com/photo-1568045374121-f59eb61c7c8d?ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80",
	"https://images.unsplash.com/photo-1572582032682-5c50aa65c51a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1567&q=80",
	"https://images.unsplash.com/photo-1579118330446-881d3052f036?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80",
	"https://www.forensisgroup.com/wp-content/uploads/2015/04/Cruise-Ship.jpg",
	"https://www.costacruise.com/B2C/ResourcesWebRevise/ships/subhome/mediterranea.jpg",
	"https://images.unsplash.com/photo-1575389642176-2503f86989bd?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80",
	"https://images.unsplash.com/photo-1551287261-594c8fb5bce6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1502&q=80",
	"https://images.unsplash.com/photo-1582647106380-7170319845b9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1400&q=80",
	"https://images.unsplash.com/photo-1567871017123-6a011b0dd9a2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80",
	"https://images.unsplash.com/photo-1518650310565-c782d7ff666e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1502&q=80"
]

21.times do
	ship = Ship.create!(
		name: Faker::Name.unique.name,
		capacity: Faker::Vehicle.engine_size,
		description: Faker::Vehicle.standard_specs * ", ",
		destination: Faker::Address.city,
		user: user1,
		location: Faker::Address.city,
    price: prices.sample
		)

	file = URI.open(photos.sample)
	sleep 0.5
	ship.photo.attach(io: file, filename: "#{ship.name}")
end
