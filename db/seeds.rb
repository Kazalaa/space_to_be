# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'

puts "cleaning db"
Planet.destroy_all
User.destroy_all
Booking.destroy_all
i = 1
puts "db cleaned"

# VEHICLES = ["Sand Crawler",
#             "T-16 skyhopper",
#             "X-34 landspeeder",
#             "TIE/LN starfighter",
#             "Snowspeeder",
#             "TIE bomber",
#             "AT-AT",
#             "AT-ST",
#             "Storm IV Twin-Pod cloud car",
#             "Sail barge"]
# PRESENT_VEHICLES = VEHICLES.sample(4, random: Random.new(1))
puts "creating user"
user1 = User.create!(email: "reertr@truc.com", password: "azerrty")
puts "user created"

59.times do
  url = "https://swapi.dev/api/planets/#{i}/"
  page_serialized = URI.open(url).read
  pages = JSON.parse(page_serialized)
  Planet.create!(name: pages['name'],
  rotation_period: pages['rotation_period'],
  diameter: pages['diameter'],
  climate: pages['climate'],
  gravity: pages['gravity'],
  surface_water: pages['surface_water'],
  terrain: pages['terrain'],
  population: pages['population'],
  price: pages['orbital_period'],
  user: user1)
  # vehicules: PRESENT_VEHICLES)
   i += 1
 end

 puts "#{Planet.count}"
