# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"

# Create User and Bench seeds...

# # Attach bench photos
# Bench.first(3).each_with_index do |bench, index|
#   bench.photo.attach(
#     # The string passed to URI.open should be the URL of the image in its bucket.
#     # This sample assumes the bucket name is `benchbnb-seeds`.
#     io: URI.open("https://benchbnb-seeds.s3.amazonaws.com/bench_#{index + 1}.jpg"), 
#     filename: "bench_#{index + 1}.jpg"
#   )
# end

ApplicationRecord.transaction do 
  puts "Destroying tables..."
# Unnecessary if using `rails db:seed:replant`
  Listing.destroy_all
  User.destroy_all


  puts "Resetting primary keys..."
# For easy testing, so that after seeding, the first `User` and `Listing` have `id` of 1
  ApplicationRecord.connection.reset_pk_sequence!('users')
  ApplicationRecord.connection.reset_pk_sequence!('listings')
end

puts "Creating users..."
# Create one user with an easy to remember username, email, and password:
User.create!(
  email: 'demo@user.io', 
  password: '!StrongPassword232305',
  last_name: 'DemoLastName',
  first_name: 'DemoFirstName'
)

puts "Creating listings..."
# Create two listings as seed data


#1
listing1 = Listing.create!(
  host_id: 1,
  address: '123 Main Street, New York, NY 10001',
  title: 'Cozy Cabin in the Woods',
  description: 'Escape to nature in this charming cabin surrounded by lush forests.',
  num_beds: 2,
  num_bedrooms: 1,
  number_bathrooms: 1,
  price: 75.0,
  has_ac: true,
  has_wifi: true,
  has_pets_allowed: false,
  has_washer_dryer: false,
  latitude: 40.7128,
  longitude: -74.0060
)

listing1_photo_urls = [
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/CozyCabin/CozyCabin1.jpeg",
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/CozyCabin/CozyCabin2.jpg",
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/CozyCabin/CozyCabin3.jpeg",
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/CozyCabin/CozyCabin4.jpeg",
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/CozyCabin/CozyCabin5.jpeg"
]

listing1_photo_urls.each_with_index do |url, index|
  listing1.photos.attach(
    io: URI.open(url),
    filename: "photo_#{index + 1}"
  )
end

# listing1




#2
listing2 = Listing.create!(
  host_id: 1,
  address: '456 Elm Avenue, Los Angeles, CA 90001',
  title: 'Lakeview Retreat',
  description: 'Enjoy stunning lake views from this spacious lakeside villa.',
  num_beds: 4,
  num_bedrooms: 2,
  number_bathrooms: 2,
  price: 150.0,
  has_ac: true,
  has_wifi: true,
  has_pets_allowed: true,
  has_washer_dryer: true,
  latitude: 34.0522,
  longitude: -118.2437
)

#3
listing3 = Listing.create!(
  host_id: 1,
  address: '789 Oak Road, Chicago, IL 60601',
  title: 'Mermaid Cove Villa',
  description: "Experience the charm of a mermaid's paradise in Key West, Florida, complete with underwater views.",
  num_beds: 4,
  num_bedrooms: 3,
  number_bathrooms: 2,
  price: 250.0,
  has_ac: true,
  has_wifi: true,
  has_pets_allowed: false,
  has_washer_dryer: true,
  latitude: 24.5551,
  longitude: -81.7799
)

#4
listing4 = Listing.create!(
  host_id: 1,
  address: "101 Maple Lane, Miami, FL 33101",
  title: "Wizard's Cottage",
  description: "Live like a wizard in this magical cottage located in the heart of Salem, Massachusetts.",
  num_beds: 3,
  num_bedrooms: 2,
  number_bathrooms: 2,
  price: 180.0,
  has_ac: true,
  has_wifi: true,
  has_pets_allowed: false,
  has_washer_dryer: true,
  latitude: 42.5232,
  longitude: -70.8862
)

#5
listing5 = Listing.create!(
  host_id: 1,
  address: "234 Pine Street, San Francisco, CA 94101",
  title: "Enchanted Forest Cabin",
  description: "Escape to an enchanted forest in this cozy cabin nestled in the Olympic National Park, Washington.",
  num_beds: 2,
  num_bedrooms: 1,
  number_bathrooms: 1,
  price: 120.0,
  has_ac: true,
  has_wifi: true,
  has_pets_allowed: true,
  has_washer_dryer: false,
  latitude: 47.8295,
  longitude: -123.6405
)

#6
listing6 = Listing.create!(
  host_id: 1,
  address: "567 Cedar Drive, Austin, TX 78701",
  title: "Atlantis Underwater Palace",
  description: "Experience luxury living in a submerged palace beneath the waves of Miami, Florida.",
  num_beds: 5,
  num_bedrooms: 4,
  number_bathrooms: 3,
  price: 550.0,
  has_ac: true,
  has_wifi: false,
  has_pets_allowed: false,
  has_washer_dryer: true,
  latitude: 25.7772,
  longitude: -80.1865
)

#7
listing7 = Listing.create!(
  host_id: 1,
  address: "890 Birch Boulevard, Seattle, WA 98101",
  title: "Dragon's Den Retreat",
  description: "Discover the hidden dragon's den in the mystical forests of Boulder, Colorado.",
  num_beds: 3,
  num_bedrooms: 2,
  number_bathrooms: 2,
  price: 190.0,
  has_ac: true,
  has_wifi: true,
  has_pets_allowed: false,
  has_washer_dryer: true,
  latitude: 40.0155,
  longitude: -105.2657
)

# 8
listing8 = Listing.create!(
  host_id: 1,
  address: "1234 Willow Lane, Denver, CO 80201",
  title: "Enchanted Hillside Castle",
  description: "Live like royalty in this enchanted castle perched on the hills of Asheville, North Carolina.",
  num_beds: 6,
  num_bedrooms: 4,
  number_bathrooms: 4,
  price: 320.0,
  has_ac: true,
  has_wifi: true,
  has_pets_allowed: true,
  has_washer_dryer: true,
  latitude: 35.6030,
  longitude: -82.5542
)

# 9
listing9 = Listing.create!(
  host_id: 1,
  address: "5678 Spruce Road, Atlanta, GA 30301",
  title: "Mermaid's Paradise Villa",
  description: "Experience the charm of a mermaid's paradise in Key West, Florida, complete with underwater views.",
  num_beds: 4,
  num_bedrooms: 3,
  number_bathrooms: 2,
  price: 260.0,
  has_ac: true,
  has_wifi: true,
  has_pets_allowed: false,
  has_washer_dryer: true,
  latitude: 24.5559,
  longitude: -81.7817
)

# 10
listing10 = Listing.create!(
  host_id: 1,
  address: "111 Redwood Avenue, Boston, MA 02101",
  title: "Unicorn Retreat",
  description: "Embark on a magical journey in this retreat nestled in the picturesque hills of Aspen, Colorado.",
  num_beds: 3,
  num_bedrooms: 2,
  number_bathrooms: 2,
  price: 220.0,
  has_ac: true,
  has_wifi: true,
  has_pets_allowed: false,
  has_washer_dryer: true,
  latitude: 39.1877,
  longitude: -106.8181
)

# 11
listing11 = Listing.create!(
  host_id: 1,
  address: "222 Sequoia Street, New Orleans, LA 70101",
  title: "Enchanted Forest Lodge",
  description: "Escape to an enchanted forest in this charming lodge located in Gatlinburg, Tennessee.",
  num_beds: 2,
  num_bedrooms: 1,
  number_bathrooms: 1,
  price: 130.0,
  has_ac: true,
  has_wifi: true,
  has_pets_allowed: true,
  has_washer_dryer: false,
  latitude: 35.7121,
  longitude: -83.5155
)

# 12
listing12 = Listing.create!(
  host_id: 1,
  address: "333 Magnolia Drive, Portland, OR 97201",
  title: "Dragon's Lair Hideaway",
  description: "Discover the hidden dragon's lair in the mystical desert of Sedona, Arizona.",
  num_beds: 3,
  num_bedrooms: 2,
  number_bathrooms: 2,
  price: 210.0,
  has_ac: true,
  has_wifi: true,
  has_pets_allowed: false,
  has_washer_dryer: true,
  latitude: 34.8697,
  longitude: -111.7602
)

# 13
listing13 = Listing.create!(
  host_id: 1,
  address: "42 Merlin's Way",
  title: "Wizard's Tower with a Magic Library",
  description: "Stay in this wizard's tower and explore the vast collection of magical books in the library.",
  num_beds: 3,
  num_bedrooms: 2,
  number_bathrooms: 2,
  price: 180.0,
  has_ac: true,
  has_wifi: true,
  has_pets_allowed: false,
  has_washer_dryer: true,
  latitude: 45.5122,
  longitude: -122.6587
)

# 14
listing14 = Listing.create!(
  host_id: 1,
  address: "789 Fantasy Street",
  title: "Hobbit Hole in the Shire",
  description: "Live like a hobbit in this cozy underground dwelling surrounded by rolling hills.",
  num_beds: 1,
  num_bedrooms: 1,
  number_bathrooms: 1,
  price: 60.0,
  has_ac: false,
  has_wifi: true,
  has_pets_allowed: true,
  has_washer_dryer: false,
  latitude: 51.5074,
  longitude: -0.1278
)

# 15
listing15 = Listing.create!(
  host_id: 1,
  address: "123 Dragonfly Lane",
  title: "Dragon Keep with Friendly Fire-breathing Dragon",
  description: "Experience a unique adventure in this castle guarded by a dragon with a heart of gold.",
  num_beds: 5,
  num_bedrooms: 4,
  number_bathrooms: 3,
  price: 250.0,
  has_ac: true,
  has_wifi: true,
  has_pets_allowed: true,
  has_washer_dryer: true,
  latitude: 37.7749,
  longitude: -122.4194
)

# 16
listing16 = Listing.create!(
  host_id: 1,
  address: "456 Enchanted Avenue",
  title: "Mystical Cottage in the Enchanted Forest",
  description: "Escape to this charming cottage nestled deep within the enchanted forest. Keep an eye out for fairies!",
  num_beds: 2,
  num_bedrooms: 1,
  number_bathrooms: 1,
  price: 90.0,
  has_ac: false,
  has_wifi: true,
  has_pets_allowed: true,
  has_washer_dryer: false,
  latitude: 41.8781,
  longitude: -87.6298
)

# 17
listing17 = Listing.create!(
  host_id: 1,
  address: "789 Wizardry Lane",
  title: "Magician's Retreat with Floating Carpets",
  description: "Stay in this magical retreat and enjoy the luxury of floating carpets that take you wherever you desire.",
  num_beds: 3,
  num_bedrooms: 2,
  number_bathrooms: 2,
  price: 160.0,
  has_ac: true,
  has_wifi: true,
  has_pets_allowed: false,
  has_washer_dryer: true,
  latitude: 51.5074,
  longitude: -0.1278
)

# 18
listing18 = Listing.create!(
  host_id: 1,
  address: "123 Wizard's Alley",
  title: "Quaint Wizard's Cottage",
  description: "Experience the whimsy of a wizard's life in this quaint cottage filled with magical artifacts and potions.",
  num_beds: 2,
  num_bedrooms: 1,
  number_bathrooms: 1,
  price: 120.0,
  has_ac: true,
  has_wifi: true,
  has_pets_allowed: true,
  has_washer_dryer: false,
  latitude: 37.7749,
  longitude: -122.4194
)

puts "Done!"