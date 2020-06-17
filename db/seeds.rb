# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# borrar los datos

Ship.destroy_all
User.destroy_all

user1 = User.create!(email: "benjaistheman@gmail.com", password: "12345678")

100.times do
  Ship.create!(
	name: Faker::Name.unique.name,
	capacity: Faker::Vehicle.engine_size,
	description: Faker::Vehicle.standard_specs,
	destination: Faker::Address.city,
	user: user1,
	location: Faker::Address.city
  )
end
