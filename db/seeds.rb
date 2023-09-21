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
Listing.create!(
  host_id: 1,
  address: '1234 Elm Street',
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

Listing.create!(
  host_id: 1,
  address: '5678 Lakefront Drive',
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

puts "Done!"
end