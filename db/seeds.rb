# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

ApplicationRecord.transaction do 
puts "Destroying tables..."
# Unnecessary if using `rails db:seed:replant`
User.destroy_all
Listing.destroy_all

puts "Resetting primary keys..."
# For easy testing, so that after seeding, the first `User` and `Listing` have `id` of 1
ApplicationRecord.connection.reset_pk_sequence!('users')
ApplicationRecord.connection.reset_pk_sequence!('listings')

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
Listing.create!(
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

#2
Listing.create!(
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
Listing.create!(
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
Listing.create!(
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
Listing.create!(
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
Listing.create!(
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
Listing.create!(
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
Listing.create!(
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
Listing.create!(
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
Listing.create!(
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
Listing.create!(
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
Listing.create!(
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



puts "Done!"
end