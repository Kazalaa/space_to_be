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

FILES = ['https://images.pexels.com/photos/39561/solar-flare-sun-eruption-energy-39561.jpeg?cs=srgb&dl=pexels-pixabay-39561.jpg&fm=jpg',
         'https://images.pexels.com/photos/87651/earth-blue-planet-globe-planet-87651.jpeg?cs=srgb&dl=pexels-pixabay-87651.jpg&fm=jpg',
         'https://images.pexels.com/photos/673902/pexels-photo-673902.jpeg?cs=srgb&dl=pexels-sevenstorm-juhaszimrus-673902.jpg&fm=jpg',
         'https://images.pexels.com/photos/2078126/pexels-photo-2078126.jpeg?cs=srgb&dl=pexels-kush-kaushik-2078126.jpg&fm=jpg',
         'https://images.pexels.com/photos/2694037/pexels-photo-2694037.jpeg?cs=srgb&dl=pexels-miriam-espacio-2694037.jpg&fm=jpg',
         'https://cdn.futura-sciences.com/buildsv6/images/wide1920/1/a/a/1aa5e55057_50157976_plane-te-b-hd.jpg',
         'https://cdn.futura-sciences.com/buildsv6/images/largeoriginal/8/1/2/8129590b3c_108529_planete-10.jpg',
         'https://mymodernmet.com/wp/wp-content/uploads/2021/01/TOI-1338-b-planet-1.jpg',
         'https://bocir-prod-bucket.s3.amazonaws.com/radios/voltage/importrk/news/original/5f7aedcecb4418.67773156.jpg',
         'https://www.ucf.edu/news/files/2018/09/ucf-pluto.jpg',
         'https://45secondes.fr/wp-content/uploads/2020/11/Une-faible-super-planete-decouverte-par-un-radiotelescope-pour-la.jpg',
         'http://cdn.eso.org/images/screen/eso1245a.jpg',
         'https://www.sciencesetavenir.fr/assets/img/2015/01/20/cover-r4x3w1000-57dfbffb41c18-planet-x.jpg',
         'https://cdn.pixabay.com/photo/2016/07/15/14/45/planet-1519089_640.jpg',
         'https://mediaproxy.salon.com/width/1200/https://media.salon.com/2021/05/planet-uranus-0519211.jpg',
         'https://algerianext.com/wp-content/uploads/2021/06/dzxtQ2dXH9SVKztJTbAXSA.jpg',
         'https://images.theconversation.com/files/388811/original/file-20210310-13-13fmyhj.jpg?ixlib=rb-1.1.0&q=45&auto=format&w=1200&h=675.0&fit=crop',
         'https://www.aeronomie.be/sites/default/files/2019-07/Mars_nasa_jpl_scan.jpg',
         'https://static.wikia.nocookie.net/frstarwars/images/6/61/Mustafar-TROSGG.png/revision/latest?cb=20201021094213',
         'https://static.wikia.nocookie.net/frstarwars/images/2/2b/Iego_TCW.jpg/revision/latest/top-crop/width/360/height/450?cb=20180414190232',
         'https://static.hitek.fr/img/actualite/ill_m/1522909918/mustafar.jpg',
         'https://static.wikia.nocookie.net/frstarwars/images/1/13/Crait_TLJVD.png/revision/latest?cb=20190605164227',
         'https://static.hitek.fr/img/actualite/w_mustafarfromspace.jpg',
         'https://img.planete-starwars.com/upload/databank/3/1677_Metelos.JPG',
         'https://ns328286.ip-37-187-113.eu/ew/wallpapers/800x480/03077_800x480.jpg',
         'https://media.firerank.com/upload/dli/13312/3ab3671a91_500.jpg']

puts "creating user"
user1 = User.create!(email: "reertr@truc.com", password: "azerrty")
puts "user created"

32.times do
  puts "creating planet#{i}"
  url = "https://swapi.dev/api/planets/#{i}/"
  file = URI.open(FILES.sample)
  page_serialized = URI.open(url).read
  pages = JSON.parse(page_serialized)
  planet = Planet.create!(name: pages['name'],
  rotation_period: pages['rotation_period'],
  diameter: pages['diameter'],
  climate: pages['climate'],
  gravity: pages['gravity'],
  surface_water: pages['surface_water'],
  terrain: pages['terrain'],
  population: pages['population'],
  price: (10..100).to_a.sample,
  user: user1)
  planet.photo.attach(io: file, filename: "planet", content_type: 'image/jpg')
  puts "planet#{i} created"
   i += 1
 end

 puts "#{Planet.count}"
